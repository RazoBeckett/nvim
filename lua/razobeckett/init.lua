require("razobeckett.keymaps")
require("razobeckett.options-globals")
require("razobeckett.lazy")
require("razobeckett.autocmds")

vim.cmd.hi("Comment cterm=italic gui=italic")
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.highlight.on_yank()
	end,
})
