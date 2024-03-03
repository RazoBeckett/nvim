return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>",        desc = "Mark file with harpoon" },
		{ "<C-h>",     "<cmd>lua require('harpoon.ui').nav_next()<CR>",          desc = "Go to next harpoon mark" },
		{ "<C-H>",     "<cmd>lua require('harpoon.ui').nav_prev()<CR>",          desc = "Go to previous harpoon mark" },
		{ "<C-e>",     "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Toggle the harpoon quick menu" },
	},
	-- config = function()
	-- 	for i = 1, 5 do
	-- 		vim.api.nvim_set_keymap("n", string.format("<leader>%s", i),
	-- 			string.format(":lua require('harpoon.ui').nav_file(%d)<CR>", i),
	-- 			{ desc = string.format("File(%s)", i), noremap = true, silent = true }
	-- 		)
	-- 	end
	-- end,
}
