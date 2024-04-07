return {
	{ "wakatime/vim-wakatime", lazy = false },
	{ "tpope/vim-sleuth", event = { "BufReadPre", "BufNewFile" } },
	{ "echasnovski/mini.hipatterns", event = { "BufReadPre", "BufNewFile" }, opts = {} },
	{ "numToStr/Comment.nvim", event = { "BufReadPre", "BufNewFile" }, opts = {} },
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				mode = "tabs",
				separator_style = "slant",
			},
		},
		config = function()
			require("bufferline").setup({})
			for i = 1, 9 do
				vim.keymap.set("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<CR>")
			end
		end,
	},
	{
		"mbbill/undotree",
		cmd = { "UndotreeToggle", "UndotreeShow" },
		keys = {
			{ "<leader>ut", "<cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree" },
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
}
