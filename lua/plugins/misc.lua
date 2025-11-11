---@diagnostic disable: undefined-global
return {
	{
		"A7Lavinraj/fyler.nvim",
		dependencies = { "nvim-mini/mini.icons" },
		branch = "stable",
		opts = {},
	},
	{ "wakatime/vim-wakatime", event = { "VeryLazy" } },
	{ "tpope/vim-sleuth", event = { "BufReadPre", "BufNewFile" } },
	{ "numToStr/Comment.nvim", event = { "BufReadPre", "BufNewFile" }, opts = {} },
	{ "lambdalisue/vim-suda", cmd = { "SudaWrite", "SudaRead" } },
	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		enabled = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = { signs = false },
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.ai").setup()
			require("mini.surround").setup()
			--[[ require("mini.files").setup()
			vim.keymap.set("n", "<leader>e", MiniFiles.open, { desc = "Open [E]xplorer" }) ]]
			local hipatterns = require("mini.hipatterns")
			-- Returns hex color group for matching short hex color.
			--
			---@param match string
			---@return string
			local hex_color_short = function(_, match)
				local style = "fg" -- 'fg' or 'bg', for extmark_opts_inline use 'fg'
				local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
				local hex = string.format("#%s%s%s%s%s%s", r, r, g, g, b, b)
				return hipatterns.compute_hex_color_group(hex, style)
			end

			-- Returns hex color group for matching rgb() color.
			--
			---@param match string
			---@return string
			local rgb_color = function(_, match)
				local style = "fg" -- 'fg' or 'bg', for extmark_opts_inline use 'fg'
				local red, green, blue = match:match("rgb%((%d+), ?(%d+), ?(%d+)%)")
				local hex = string.format("#%02x%02x%02x", red, green, blue)
				return hipatterns.compute_hex_color_group(hex, style)
			end

			-- Returns hex color group for matching rgba() color
			-- or false if alpha is nil or out of range.
			-- The use of the alpha value refers to a black background.
			--
			---@param match string
			---@return string|false
			local rgba_color = function(_, match)
				local style = "fg" -- 'fg' or 'bg', for extmark_opts_inline use 'fg'
				local red, green, blue, alpha = match:match("rgba%((%d+), ?(%d+), ?(%d+), ?(%d*%.?%d*)%)")
				alpha = tonumber(alpha)
				if alpha == nil or alpha < 0 or alpha > 1 then
					return false
				end
				local hex = string.format("#%02x%02x%02x", red * alpha, green * alpha, blue * alpha)
				return hipatterns.compute_hex_color_group(hex, style)
			end

			-- Returns extmark opts for highlights with virtual inline text.
			--
			---@param data table Includes `hl_group`, `full_match` and more.
			---@return table
			local extmark_opts_inline = function(_, _, data)
				return {
					virt_text = { { " ", data.hl_group } },
					virt_text_pos = "inline",
					-- priority = 200,
					right_gravity = false,
				}
			end

			hipatterns.setup({
				highlighters = {
					-- `#rrggbb`
					-- hex_color = hipatterns.gen_highlighter.hex_color({ style = 'full' }),
					hex_color = hipatterns.gen_highlighter.hex_color({ style = "inline", inline_text = " " }),
					-- `#rgb`
					hex_color_short = {
						pattern = "#%x%x%x%f[%X]",
						group = hex_color_short,
						extmark_opts = extmark_opts_inline,
					},
					-- `rgb(255, 255, 255)`
					rgb_color = {
						pattern = "rgb%(%d+, ?%d+, ?%d+%)",
						group = rgb_color,
						extmark_opts = extmark_opts_inline,
					},
					-- `rgba(255, 255, 255, 0.5)`
					rgba_color = {
						pattern = "rgba%(%d+, ?%d+, ?%d+, ?%d*%.?%d*%)",
						group = rgba_color,
						extmark_opts = extmark_opts_inline,
					},
				},
			})
		end,
	},
	{
		enabled = true,
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
		event = "UIEnter",
		version = "*",
		config = function()
			require("bufferline").setup({
				highlights = {
					background = { bg = "none" },
					fill = { bg = "none" },
					buffer_selected = { bg = "none", fg = "#fab387" },
					buffer_visible = { bg = "none", fg = "#a6adc8" },
					close_button = { bg = "none" },
					close_button_selected = { bg = "none" },
					close_button_visible = { bg = "none" },
					duplicate = { bg = "none" },
					duplicate_selected = { bg = "none" },
					duplicate_visible = { bg = "none" },
					error = { bg = "none" },
					error_selected = { bg = "none" },
					error_visible = { bg = "none" },
					hint = { bg = "none" },
					hint_selected = { bg = "none" },
					hint_visible = { bg = "none" },
					indicator_selected = { bg = "none" },
					indicator_visible = { bg = "none" },
					info = { bg = "none" },
					info_selected = { bg = "none" },
					info_visible = { bg = "none" },
					modified = { bg = "none" },
					modified_selected = { bg = "none" },
					modified_visible = { bg = "none" },
					numbers = { bg = "none" },
					numbers_selected = { bg = "none" },
					numbers_visible = { bg = "none" },
					offset_separator = { bg = "none" },
					pick = { bg = "none" },
					pick_selected = { bg = "none" },
					pick_visible = { bg = "none" },
					separator = { bg = "none" },
					separator_selected = { bg = "none" },
					separator_visible = { bg = "none" },
					tab = { bg = "none" },
					tab_close = { bg = "none" },
					tab_selected = { bg = "none" },
					tab_separator = { bg = "none" },
					tab_separator_selected = { bg = "none" },
					trunc_marker = { bg = "none" },
					warning = { bg = "none" },
					warning_selected = { bg = "none" },
					warning_visible = { bg = "none" },
				},
				options = {
					show_buffer_close_icons = false,
					numbers = "ordinal",
					indicator = {
						icon = "",
						style = "none",
					},
					separator_style = { "", "" },
				},
			})
			for i = 1, 9 do
				vim.keymap.set("n", "<leader>" .. i, string.format("<cmd>BufferLineGoToBuffer %s <CR>", i))
			end

			-- Make bufferline transparent with a timer to ensure it applies after everything loads
			local function make_transparent()
				-- Get all BufferLine highlight groups and make them transparent
				local hls = vim.api.nvim_get_hl(0, {})
				for name, _ in pairs(hls) do
					if name:match("^BufferLine") then
						local hl = vim.api.nvim_get_hl(0, { name = name })
						if hl.bg then
							vim.api.nvim_set_hl(0, name, vim.tbl_extend("force", hl, { bg = "NONE" }))
						end
					end
				end
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
	{
		"laytan/cloak.nvim",
		ft = "dotenv",
		config = function()
			require("cloak").setup({
				highlight_group = "None",
			})
			vim.keymap.set("n", "<leader>S", "<cmd>CloakPreviewLine<cr>")
		end,
	},
	{
		"mistweaverco/kulala.nvim",
		keys = {
			{ "<leader>Rs", desc = "Send request" },
			{ "<leader>Ra", desc = "Send all requests" },
			{ "<leader>Rb", desc = "Open scratchpad" },
		},
		ft = { "http", "rest" },
		opts = {
			global_keymaps = true,
			global_keymaps_prefix = "<leader>R",
			kulala_keymaps_prefix = "",
		},
	},
	{
		dir = "/home/razobeckett/Developer/personal/spoclient.nvim",
		name = "spoclient.nvim",
		config = function()
			require("spotify").setup({
				clientId = "cdf07ff3f98e4d19b2c49f14c1d78873",
			})
		end,
		dependencies = {
			"folke/snacks.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
}
