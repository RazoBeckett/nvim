return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		{ "j-hui/fidget.nvim", opts = {} },
		"williamboman/mason.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")
		local mason_lspconfig = require("mason-lspconfig")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local map = function(key, func, desc)
					vim.keymap.set("n", key, func, { buffer = ev.buf, silent = true, desc = desc })
				end
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("gd", vim.lsp.buf.definition, "[G]oto [d]efinition")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("gT", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")
				map("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
				map("gr", vim.lsp.buf.references, "[G]et [R]eferences")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
			end,
		})
		local original_capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)

		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			},
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						-- [vim.diagnostic.severity.INFO] = diagnostic.message,
						-- [vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({ capabilities = capabilities })
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					diagnostics = {
						global = { "vim" },
					},
					completion = {
						callSnippets = "Replace",
					},
				})
			end,
			["ansiblels"] = function()
				lspconfig["ansiblels"].setup({
					cmd = { "ansible-language-server", "--stdio" },
					filetypes = { "yaml", "ansible" },
					init_options = {
						extraVars = {
							ansible = {
								ansible = "ansible",
								ansiblePlaybook = "ansible-playbook",
								ansibleGalaxy = "ansible-galaxy",
								ansibleLint = "ansible-lint",
							},
						},
					},
				})
			end,
			["gopls"] = function()
				lspconfig["gopls"].setup({
					cmd = { "gopls" },
					filetypes = { "go", "gomod", "gowork", "gotmpl" },
					root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				})
			end,
		})
	end,
}
