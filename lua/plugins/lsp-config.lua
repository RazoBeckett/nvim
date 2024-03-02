return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pylsp", "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			local lspconfig = require("lspconfig")
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [d]efinition" })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
			vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { desc = "[G]oto [T]ype Definition" })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
			-- diagnostics
			-- vim.keymap.set("n", "<leader>d[", vim.lsp.diagnostic.goto_prev, { desc = "Show Line Diagnostics" })
			-- vim.keymap.set("n", "<leader>d]", vim.lsp.diagnostic.goto_next, { desc = "Show Line Diagnostics" })
			-- lsp mention
			lspconfig.lua_ls.setup({ capabilities = capabilities, filetype = { "lua" } })
			lspconfig.pyright.setup({ capabilities = capabilities, filetype = { "python" } })
			lspconfig.bashls.setup({ capabilities = capabilities, filetype = { "sh", "bash" } })
			lspconfig.docker_compose_language_service.setup({ capabilities = capabilities , filetype = { "yml", "yaml" } })
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.dockerls.setup({ capabilities = capabilities, filetype = { "dockerfile" } })
			lspconfig.ast_grep.setup({ capabilities = capabilities })
			lspconfig.intelephense.setup({ capabilities = capabilities })
		end,
	},
}
