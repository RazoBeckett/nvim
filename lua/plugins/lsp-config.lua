return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- Mason core & Mason-LSPConfig bridge
		{ "williamboman/mason.nvim", version = "^1.0.0" },
		{ "williamboman/mason-lspconfig.nvim", version = "^1.0.0" },

		-- Completion engine replacement
		-- "saghen/blink.cmp"

		-- Optional helpers
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- Bootstrap Mason
		local mason = require("mason")
		mason.setup()

		-- Bridge Mason -> lspconfig
		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup({
			ensure_installed = { "lua_ls", "ansiblels", "gopls" },
			-- automatic_installation = true, -- Removed in v.2.0.0
		})

		-- Shared on_attach & capabilities
		local blink_cmp = require("blink.cmp")
		blink_cmp.setup()

		local capabilities = blink_cmp.get_lsp_capabilities({
			vim.lsp.protocol.make_client_capabilities(),
			-- require("lsp-file-operations").default_capabilities(),
		})

		local on_attach = function(client, bufnr)
			local bufmap = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
			end
			bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
			bufmap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
			bufmap("n", "gd", vim.lsp.buf.definition, "[G]oto [d]efinition")
			bufmap("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			bufmap("n", "gT", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")
			bufmap("n", "gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
			bufmap("n", "gr", vim.lsp.buf.references, "[G]et [R]eferences")
			bufmap("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			-- Using Snacks picker take a look at 'Snacks.picker.lua' file
			bufmap("n", "<leader>D", function()
				Snacks.picker.lsp_type_definitions() -- Snacks
				-- require("telescope.builtin").lsp_type_definitions() -- Telescope
			end, "Type [D]efinition")
			bufmap("n", "<leader>ds", function()
				Snacks.picker.lsp_symbols() -- Snacks
				-- require("telescope.builtin").lsp_document_symbols() -- Telescope
			end, "[D]ocument [S]ymbols")
			bufmap("n", "<leader>ws", function()
				Snacks.picker.lsp_workspace_symbols()
				-- require("telescope.builtin").lsp_dynamic_workspace_symbols() -- Telescope
			end, "[W]orkspace [S]ymbols")
		end

		-- Global diagnostics config
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
			},
		})

		-- Auto-setup all installed servers with optional overrides
		mason_lspconfig.setup_handlers({
			-- Default handler
			function(server_name)
				require("lspconfig")[server_name].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,

			-- lua_ls override
			["lua_ls"] = function()
				require("lspconfig").lua_ls.setup({
					on_attach = on_attach,
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							completion = { callSnippet = "Replace" },
						},
					},
				})
			end,

			-- ansiblels override
			["ansiblels"] = function()
				require("lspconfig").ansiblels.setup({
					on_attach = on_attach,
					capabilities = capabilities,
					cmd = { "ansible-language-server", "--stdio" },
					filetypes = { "yaml", "ansible" },
					init_options = {
						ansible = {
							ansible = "ansible",
							ansiblePlaybook = "ansible-playbook",
							ansibleLint = "ansible-lint",
						},
					},
				})
			end,

			-- gopls override
			["gopls"] = function()
				require("lspconfig").gopls.setup({
					on_attach = on_attach,
					capabilities = capabilities,
					cmd = { "gopls" },
					filetypes = { "go", "gomod", "gowork", "gotmpl" },
					root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
				})
			end,
		})

		-- optional overrides

		--[[ local lspconfig = require("lspconfig")

		-- lua_ls override
		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					completion = { callSnippet = "Replace" },
				},
			},
		})

		-- ansiblels override
		lspconfig.ansiblels.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "ansible-language-server", "--stdio" },
			filetypes = { "yaml", "ansible" },
			init_options = {
				ansible = {
					ansible = "ansible",
					ansiblePlaybook = "ansible-playbook",
					ansibleLint = "ansible-lint",
				},
			},
		})

		-- gopls override
		lspconfig.gopls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
		}) ]]
	end,
}
