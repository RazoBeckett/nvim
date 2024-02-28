require("razobeckett.vim-keymaps")
require("razobeckett.vim-options")
require("razobeckett.lazy")

vim.cmd.hi("Comment cterm=italic gui=italic")
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.highlight.on_yank()
	end,
})
