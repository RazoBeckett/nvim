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
		"RRethy/nvim-base16",
		priority = 1000,
		dependencies = {
			"xiyaowong/transparent.nvim",
		},
		config = function ()
			require("base16-colorscheme").setup({
				base00= '#242b26', base01= '#2f2a3f', base02= '#46354a', base03= '#6c3c62',
				base04= '#7e5f83', base05= '#eed5d9', base06= '#d9c2c6', base07= '#e4ccd0',
				base08= '#de5b44', base09= '#e39755', base0A= '#a84a73', base0B= '#c965bf',
				base0C= '#9c5fce', base0D= '#6a9eb5', base0E= '#6ac38f', base0F= '#a3ab5a',
			})
		end
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
