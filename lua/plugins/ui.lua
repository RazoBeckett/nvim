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
	--[[ {
		"catppuccin/nvim",
		priority = 1000,
		dependencies = {
			"xiyaowong/transparent.nvim",
		},
		opts = {
			integrations = {
				aerial = true,
				alpha = true,
				cmp = true,
				dashboard = true,
				flash = true,
				gitsigns = true,
				headlines = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				leap = true,
				lsp_trouble = true,
				mason = true,
				markdown = true,
				mini = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				navic = { enabled = true, custom_bg = "lualine" },
				neotest = true,
				neotree = true,
				noice = true,
				notify = true,
				semantic_tokens = true,
				telescope = true,
				treesitter = true,
				treesitter_context = true,
				which_key = true,
			},
		},
		config = function()
			vim.o.background = "dark"
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	}, ]]
	--
	{
		"tjdevries/colorbuddy.nvim",
		priority = 1000,
		dependencies = {
			"xiyaowong/transparent.nvim",
		},
		config = function()
			require("colorbuddy").colorscheme("uwunicorn")

			local colorbuddy = require("colorbuddy")
			local Color = colorbuddy.Color
			local Group = colorbuddy.Group
			local c = colorbuddy.colors
			local g = colorbuddy.groups
			local s = colorbuddy.styles

			-- Define your new colors based on the provided hex codes
			Color.new("white", "#eed5d9")
			Color.new("red", "#de5b44")
			Color.new("pink", "#e39755") -- Adjusted for visibility
			Color.new("green", "#6ac38f")
			Color.new("yellow", "#e39755")
			Color.new("blue", "#6a9eb5")
			Color.new("aqua", "#9c5fce") -- Adjusted for visibility
			Color.new("cyan", "#9c5fce")
			Color.new("purple", "#c965bf")
			Color.new("violet", "#6a9eb5") -- Adjusted for visibility
			Color.new("orange", "#de5b44") -- Adjusted for visibility
			Color.new("brown", "#46354a") -- Adjusted for visibility

			Color.new("seagreen", "#6ac38f") -- Adjusted for visibility
			Color.new("turquoise", "#9c5fce") -- Adjusted for visibility

			-- Adjust background color for better visibility of other elements
			local background_string = "#241b26"
			Color.new("background", background_string)
			Color.new("gray0", background_string)

			-- Define groups with the new colors
			Group.new("Normal", c.white, c.background)

			Group.new("@constant", c.orange, nil, s.none)
			Group.new("@function", c.yellow, nil, s.none)
			Group.new("@function.bracket", g.Normal, g.Normal)
			Group.new("@keyword", c.purple, nil, s.none)
			Group.new("@keyword.faded", g.nontext.fg:light(), nil, s.none)
			Group.new("@property", c.blue)
			Group.new("@variable", c.white, nil)
			Group.new("@variable.builtin", c.purple:light():light(), g.Normal)

			-- Lua function calls adjusted to a shade of blue
			Group.new("@function.call.lua", c.blue:dark(), nil, nil)

			vim.o.background = "dark"
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
