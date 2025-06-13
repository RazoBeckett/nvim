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
	enabled = false,
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
	priority = 1000,
	terminal_colors = true,

	-- Actual plugin list
	uwunified_spec,
	{
		"webhooked/kanso.nvim",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("kanso").setup({
				theme = "zen",
				transparent = true,
			})
			require("kanso").load("zen")
		end,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			indent = {
				enabled = true,
				priority = 1,
				animate = { enabled = false },
			},
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
