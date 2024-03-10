return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright",
				"bashls",
				"docker_compose_language_service",
				"clangd",
				"dockerls",
				"html",
				"tsserver",
				"cssls",
				"intelephense",
			},
		},
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
		local map = function(key, func, desc)
			vim.keymap.set("n", key, func, { desc = desc })
		end
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("gd", vim.lsp.buf.definition, "[G]oto [d]efinition")
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("gT", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")
		map("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
		map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
		map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

		-- lsp mentions
		local lspname = function(name, filetypes)
			require("lspconfig")[name].setup({ capabilities = capabilities, filetype = filetypes })
		end
		lspname("lua_ls", { "lua" })
		lspname("pyright", { "python" })
		lspname("bashls", { "sh", "bash" })
		lspname("docker_compose_language_service", { "yml", "yaml" })
		lspname("clangd", { "c", "cpp" })
		lspname("dockerls", { "dockerfile" })
		lspname("html", { "html" })
		lspname("tsserver", { "javascript", "typescript" })
		lspname("cssls", { "css" })
		lspname("intelephense", { "php" })

		require("mason").setup()
		require("mason-tool-installer").setup({ ensure_installed = { "stylua", "lua_ls", "pylsp", "pyright" } })
		require("mason-lspconfig").setup({ opts = { auto_install = true } })
	end,
}
