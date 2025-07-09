return {
	"ibhagwan/fzf-lua",
	enabled = false,
	-- optional for icon support
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	keys = {
		{
			"<leader>sf",
			function()
				require("fzf-lua").files()
			end,
			desc = "[S]earch [F]iles",
		},
		{
			"<leader>sh",
			function()
				require("fzf-lua").help_tags()
			end,
			desc = "[S]earch [H]elp",
		},
		{
			"<leader>sw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "[S]earch current [W]ord",
		},
		{
			"<leader>sd",
			function()
				require("fzf-lua").lsp_document_diagnostics()
			end,
			desc = "[S]earch [D]iagnostics",
		},
		{
			"<leader>sb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "[S]earch [B]uffers",
		},
		{
			"<leader>sk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "[S]earch [K]eymaps",
		},
		{
			"<leader>sr",
			function()
				require("fzf-lua").lsp_references()
			end,
			desc = "[S]earch [R]eferences",
		},
		{
			"<C-p>",
			function()
				local fzf = require("fzf-lua")
				if not pcall(fzf.git_files) then
					fzf.files()
				end
			end,
			desc = "[S]earch Git [F]iles",
		},
		{
			"<leader>/",
			function()
				require("fzf-lua").grep_curbuf()
			end,
			desc = "[/] Fuzzily search in current buffer",
		},
		{
			"<leader>s/",
			function()
				require("fzf-lua").live_grep({
					grep_opts = "--files-with-matches --no-heading --hidden --binary-files=without-match",
				})
			end,
			desc = "[S]earch [/] in Open Files",
		},
		{
			"<leader>s.",
			function()
				require("fzf-lua").live_grep({ cwd = vim.fn.getcwd() })
			end,
			desc = "[S]earch [.] in PWD",
		},
		{
			"<leader>sv",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[S]earch Neo[v]im files",
		},
		{
			"<leader>sn",
			function()
				require("fzf-lua").files({ cwd = "~/Documents/Notes/" })
			end,
			desc = "[S]earch [N]otes",
		},
	},
}
