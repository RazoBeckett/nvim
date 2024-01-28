return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	branch = "v3.x",
	config = function()
		vim.keymap.set("n", "<C-q>", ":Neotree focus<CR>", {})
		vim.keymap.set("n", "<C-tab>", ":Neotree toggle<CR>", {})
	end,
}
