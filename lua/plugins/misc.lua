return {
	{ "tpope/vim-sleuth" },
	{ "j-hui/fidget.nvim", opts = {} },
	{ "numToStr/Comment.nvim", opts = {} },
	{ "wakatime/vim-wakatime", lazy = false },
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = { signs = false } },
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
			require("mini.statusline").setup()
		end,
	},
	{
		"MarcHamamji/runner.nvim",
		config = function()
			require("runner").setup({
				position = "right",
				width = 75,
				height = 10,
			})
			vim.keymap.set("n", "<F5>", require("runner").run)
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
}
