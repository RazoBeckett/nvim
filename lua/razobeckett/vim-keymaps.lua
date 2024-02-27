vim.g.mapleader = " "

local k = vim.keymap.set

-- borrowed from theprimeagen 
k("n", "J", "mzJ`z")
k("n", "-", ":Ex<CR>")
k("x", "<leader>p","\"_dP")
k("v", "K", ":m '<-2<CR>gv=gv")
k("v", "J", ":m '>+1<CR>gv=gv")
k("n", "<leader>x","<cmd>!chmod +x %<CR>", {silent = true})
k("n", "<leader><F5>","<cmd>!python %<CR>", {silent = true})
