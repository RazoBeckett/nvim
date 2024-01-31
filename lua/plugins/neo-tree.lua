return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	branch = "v3.x",
	config = function()
		require("neo-tree").setup({
			default_component_configs = {
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_symlink = "",
					folder_empty = "",
					default = "󰈚",
					highlight = "NeoTreeFolderIcon",
				},
				git_status = {
					symbols = {
						unstaged = "✗",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "★",
						deleted = "",
						ignored = "◌",
					},
				},
			},
		})
		vim.keymap.set("n", "<C-q>", ":Neotree focus<CR>", {})
		vim.keymap.set("n", "<C-tab>", ":Neotree toggle<CR>", {})
	end,
}
