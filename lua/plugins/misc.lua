return {
	{ "tpope/vim-sleuth" },
	{ "numToStr/Comment.nvim",    opts = {} },
	{ "wakatime/vim-wakatime",    lazy = false },
	{ "folke/todo-comments.nvim", event = 'VimEnter', dependencies = { "nvim-lua/plenary.nvim" }, opts = { signs = false } },
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
			local statusline = require("mini.statusline")
			statusline.setup()
			statusline.section_location = function() return "" end
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
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require("bufferline").setup {}
			for i = 1, 9 do
				vim.keymap.set("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<CR>")
			end
		end
	},
}
