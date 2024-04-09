-- globals
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.g.netrw_banner = 0 -- disable netrw banner
vim.g.netrw_liststyle = 3 -- netrw list style

-- keympas
local k = vim.keymap.set

k("n", "H", "^", { silent = true, desc = "Go to BOL" })
k("n", "L", "$", { silent = true, desc = "Go to EOL" })
k("i", "jk", "<Esc>", { silent = true, desc = "jk to escape" })
k("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlights" })
k("n", "<leader><F5>", "<cmd>!python %<CR>", { silent = true, desc = "Run Python" })
k("n", "<leader><F6>", ":e %:h", { desc = "Create New file" })
k("n", "+", "<C-a>", { silent = true, desc = "Increment number" })
k("n", "-", "<C-x>", { silent = true, desc = "Decrement number" })
k("n", "<leader>e", function()
	require("oil").toggle_float()
end, { desc = "Open Oil Float" })

-- borrowed from Josean Martinez
k("n", "<leader>Sv", "<C-w>v", { desc = "Split window vertically" })
k("n", "<leader>Sh", "<C-w>s", { desc = "Split window horizontally" })
k("n", "<leader>Se", "<C-w>=", { desc = "Make split equal" })
k("n", "<leader>Sx", "<cmd>close<CR>", { desc = "Close current split" })

-- borrowed from theprimeagen
k("n", "J", "mzJ`z", { silent = true, desc = "Join lines and keep cursor position" })
k("x", "<leader>p", '"_dP', { silent = true, desc = "Paste without yanking" })
k("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move line up" })
k("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move line down" })
k("n", "<leader>x!", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Set Execution Permission" })
k("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Scroll up" })
k("n", "<C-d>", "<C-d>zz", { silent = true, desc = "Scroll down" })

-- borrowed from kickstart.nvim @tjdevries
k("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
