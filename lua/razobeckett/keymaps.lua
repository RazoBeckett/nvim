-- function to set keymaps
local function k(m, map, cmd, desc, silent)
	if silent == nil then
		silent = false
	end
	vim.keymap.set(m, map, cmd, { silent = silent, desc = desc })
end

-- keymaps
k("n", "H", "^", "Go to BOL", true)
k("n", "L", "$", "Go to EOL", true)
-- k("i", "jk", "<Esc>", "jk to escape", true)
k("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear highlights")
k("n", "<leader><F5>", "<cmd>!python %<CR>", "Run Python", true)
k("n", "<leader><F6>", ":e %:h", "Create New file")
k("n", "+", "<C-a>", "Increment number", true)
k("n", "-", "<C-x>", "Decrement number", true)
k("n", "gl", function()
	vim.diagnostic.open_float()
end, "Open diagnostics in Float", true)

-- borrowed from Josean Martinez
k("n", "<leader>Sv", "<C-w>v", "Split window vertically")
k("n", "<leader>Sh", "<C-w>s", "Split window horizontally")
k("n", "<leader>Se", "<C-w>=", "Make split equal")
k("n", "<leader>Sx", "<cmd>close<CR>", "Close current split")

-- borrowed from theprimeagen
k("n", "J", "mzJ`z", "Join lines and keep cursor position", true)
k("x", "<leader>p", '"_dP', "Paste without yanking", true)
k("v", "K", ":m '<-2<CR>gv=gv", "Move line up", true)
k("v", "J", ":m '>+1<CR>gv=gv", "Move line down", true)
k("n", "<leader>x!", "<cmd>!chmod +x %<CR>", "Set Execution Permission", true)
k("n", "<C-u>", "<C-u>zz", "Scroll up", true)
k("n", "<C-d>", "<C-d>zz", "Scroll down", true)

-- borrowed from kickstart.nvim @tjdevries
k("t", "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")
