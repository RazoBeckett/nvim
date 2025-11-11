-- discipline
require("razobeckett.keymaps")
require("razobeckett.options-globals")
require("razobeckett.lazy")
require("razobeckett.lsp")
require("razobeckett.autocmds")
require("razobeckett.floating-terminal")

vim.cmd.hi("Comment cterm=italic gui=italic")
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.filetype.add({
	filename = {
		[".env"] = "dotenv",
		["env"] = "dotenv",
	},
	pattern = {
		["%.env%..+"] = "dotenv",
	},
})

local discipline = require("razobeckett.discipline")
discipline.cowboy()
