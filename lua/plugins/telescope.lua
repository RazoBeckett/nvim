return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				prompt_prefix = "   ",
				layout_strategy = "horizontal",
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
					preview_width = 0.6,
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "fzf")
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "[S]earch Git [F]iles" })
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffer" })
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({
				cwd = vim.fn.stdpath("config"),
			})
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
