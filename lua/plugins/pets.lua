return {
	"giusgad/pets.nvim",
	dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
	config = function()
		require("pets").setup({row = 5})
	end,
}
