return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"ts_ls",
			"gopls",
			"tailwindcss",
			"html",
			"lua_ls",
			"pyright",
		},
	},
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		"neovim/nvim-lspconfig",
	},
}
