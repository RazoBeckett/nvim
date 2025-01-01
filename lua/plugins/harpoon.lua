return {
	enabled = false,
	"ThePrimeagen/harpoon",
	keys = {
		{ "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>",        desc = "Mark file with harpoon" },
		{ "<C-S-l>",    "<cmd>lua require('harpoon.ui').nav_next()<CR>",          desc = "Go to next harpoon mark" },
		{ "<C-S-h>",    "<cmd>lua require('harpoon.ui').nav_prev()<CR>",          desc = "Go to previous harpoon mark" },
		{ "<C-e>",      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Toggle the harpoon quick menu" },
	},
	config = function()
		for i = 1, 5 do
			vim.api.nvim_set_keymap("n", string.format("<leader>h%s", i),
				string.format(":lua require('harpoon.ui').nav_file(%d)<CR>", i),
				{ desc = string.format("Harpoon File(%s)", i), noremap = true, silent = true }
			)
		end
	end,
}
