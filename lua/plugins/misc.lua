return {
	{ "wakatime/vim-wakatime", lazy = false },
	-- { "nvim-lua/plenary.nvim", lazy = true },
	{ "tpope/vim-sleuth", event = { "BufReadPre", "BufNewFile" } },
	{ "numToStr/Comment.nvim", event = { "BufReadPre", "BufNewFile" }, opts = {} },
	{ "lambdalisue/vim-suda" },
	{
		"folke/todo-comments.nvim",
		enabled = false,
		event = { "BufReadPre", "BufNewFile" },
		opts = { signs = false },
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.ai").setup()
			require("mini.surround").setup()
			local hipatterns = require("mini.hipatterns")
			require("mini.hipatterns").setup({
				highlighters = {
					-- Highlight hex color strings (`#rrggbb`) using that color
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
		end,
	},
	{
		enabled = false,
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				use_default_keymaps = false,
				keymaps = {
					["g?"] = "actions.show_help",
					["<CR>"] = "actions.select",
					["<C-\\>"] = "actions.select_split",
					["<C-enter>"] = "actions.select_vsplit",
					["<C-t>"] = "actions.select_tab",
					["q"] = "actions.close",
					["<C-r>"] = "actions.refresh",
					["-"] = "actions.parent",
					["_"] = "actions.open_cwd",
					["`"] = "actions.cd",
					["~"] = "actions.tcd",
					["gs"] = "actions.change_sort",
					["gx"] = "actions.open_external",
					["g."] = "actions.toggle_hidden",
				},
				view_options = {
					show_hidden = true,
				},
			})
			vim.keymap.set("n", "<leader>e", function()
				require("oil").toggle_float()
			end, { desc = "Open Oil Float" })
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		config = function()
			require("bufferline").setup({
				options = {
					show_buffer_close_icons = false,
					numbers = "ordinal",
				},
			})
			for i = 1, 9 do
				vim.keymap.set("n", "<leader>" .. i, string.format("<cmd>BufferLineGoToBuffer %s <CR>", i))
			end
		end,
	},
	{
		"mbbill/undotree",
		cmd = { "UndotreeToggle", "UndotreeShow" },
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree" },
		},
	},
	{
		enabled = false,
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
}
