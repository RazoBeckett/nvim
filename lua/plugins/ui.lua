local uwunified_spec

local path_to_uwunified = "/home/razobeckett/Developer/personal/uwunified.nvim"

if vim.loop.fs_stat(path_to_uwunified) ~= nil then
	uwunified_spec = {
		dir = path_to_uwunified,
	}
else
	uwunified_spec = {
		"razobeckett/uwunified.nvim",
		-- vim.notify("uwunified.nvim not found, using remote version", vim.log.levels.WARN),
	}
end

uwunified_spec = vim.tbl_deep_extend("force", uwunified_spec, {
	dependencies = {
		"xiyaowong/transparent.nvim",
	},
	config = function()
		require("transparent").setup({
			exclude_groups = { "CursorLine" },
		})
		vim.cmd.colorscheme("uwunified")
	end,
})

return {
	lazy = false,
	terminal_colors = true,

	-- Actual plugin list
	uwunified_spec,

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
		},
	},
}
