return {
	{"tpope/vim-fugitive"},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPost",
		config = function()
			require("gitsigns").setup({
				on_attach = function()
					require("gitsigns").setup({
						signs = {
							add = { text = "▎" },
							change = { text = "▎" },
							delete = { text = "_" },
							topdelete = { text = "‾" },
							changedelete = { text = "▎" },
						},
					})
					vim.keymap.set(
						"n",
						"<leader>gp",
						"<cmd>Gitsigns preview_hunk<CR>",
						{ desc = "[G]it [P]review Hunk" }
					)
					vim.keymap.set(
						"n",
						"<leader>gt",
						"<cmd>Gitsigns toggle_current_line_blame<CR>",
						{ desc = "[G]it [T]oggle Line Blame" }
					)
				end,
			})
		end,
	},
	{
		enabled = false,
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<CR>", { desc = "Open [L]azy[G]it" } },
		},
	},
}
