return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			default_file_explorer = true,
		})
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
