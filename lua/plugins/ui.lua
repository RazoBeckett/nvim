return {
	lazy = false,
	terminal_colors = true,
	{
		"razobeckett/uwunified.nvim",
		-- dir = "/home/razobeckett/Developer/personal/uwunified.nvim",
		dependencies = {
			--- for trnasparent background
			"xiyaowong/transparent.nvim",
		},
		config = function()
			require("transparent").setup({
				exclude_groups = { "CursorLine" },
			})
			vim.cmd.colorscheme("uwunified")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
		main = "ibl",
	},
	{
		"echasnovski/mini.indentscope",
		event = "VeryLazy",
		opts = {
			symbol = "│",
			options = { try_as_border = true },
			draw = {
				animation = require("mini.indentscope").gen_animation.none(),
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			statuscolumn = { enabled = false },
			words = { enabled = false },
			lazygit = {},
		},
		keys = {
			{
				"<leader>un",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss all notifications",
			},
			{
				"<leader>lg",
				function()
					Snacks.lazygit()
				end,
				desc = "Open [L]azy[G]it",
			},
			{
				"<leader>gl",
				function()
					Snacks.lazygit.log()
				end,
				desc = "Open [G]it [L]og",
			},
		},
	},
}
