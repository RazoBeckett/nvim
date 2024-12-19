return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"folke/todo-comments.nvim",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				-- path_display = { "smart" },
				-- preview = false,
				prompt_prefix = " 󰈞 ",
				layout_strategy = "center",
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
				},
			},
			extensions = {
				fzf = {},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "fzf")
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffer" })
		vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<CR>", { desc = "[S]earch [T]odo Tags" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sr", builtin.lsp_references, { desc = "[S]earch [R]eferences" })

		vim.keymap.set("n", "<C-p>", function()
			if not pcall(builtin.git_files) then
				builtin.find_files()
			end
		end, { desc = "[S]earch Git [F]iles" })

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

		vim.keymap.set("n", "<leader>s.", function()
			builtin.live_grep({
				prompt_title = "Live Grep in PWD",
			})
		end, { desc = "[S]earch [.] in PWD" })

		vim.keymap.set("n", "<leader>sv", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch Neo[v]im files" })

		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = "~/Documents/Notes/" })
		end, { desc = "[S]earch [N]otes" })
	end,
}
