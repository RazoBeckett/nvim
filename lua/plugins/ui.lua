return {
	lazy = false,
	terminal_colors = true,
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = function()
			require("dressing").setup()
		end,
	},
	{
		-- "razobeckett/uwunified.nvim",
		dir = "/home/razobeckett/Developer/personal/uwunified.nvim",
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
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Dismiss all Notifications",
			},
		},
		opts = {
			timeout = 2200,
			background_colour = "#000000",
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
		},
		init = function()
			vim.notify = require("notify")
		end,
	},
}
