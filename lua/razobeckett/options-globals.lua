-- global options --
local globals = {
	-- leader and local leader
	mapleader = " ",
	maplocalleader = " ",
	-- disable netrw
	loaded_netrwPlugin = 1,
	loaded_netrw = 1,
	netrw_banner = 0,
	netrw_liststyle = 3,
}

for global, value in pairs(globals) do
	vim.g[global] = value
end

-- vim options --
vim.scriptencoding = "utf-8" -- set the encoding of the script
vim.opt.clipboard:append("unnamedplus") -- use the system clipboard
vim.opt.iskeyword:append("-") -- the dash(-) will be considered as part of the word
vim.opt.path:append("**") -- search for files in the current directory and its subdirectories
local options = {
	-- line wrapping
	wrap = false,
	-- encoding
	encoding = "utf-8",
	fileencoding = "utf-8",
	-- show invisible characters
	list = true,
	listchars = { tab = "» ", trail = "·", nbsp = "␣", eol = "↲" },
	-- line numbers
	number = true,
	relativenumber = true,
	--search options
	ignorecase = true,
	smartcase = true,
	cursorline = true,
	hlsearch = true,
	incsearch = true,
	--tab and indentation
	tabstop = 2,
	shiftwidth = 2,
	softtabstop = 2,
	smarttab = true,
	expandtab = true,
	autoindent = true,
	breakindent = true,
	--appearance
	termguicolors = true,
	background = "dark",
	signcolumn = "yes",
	--backspace key
	backspace = { "indent", "eol", "start" },
	--slip window
	splitright = true,
	splitbelow = true,
	--misc.
	undofile = true, -- undo persistence
	scrolloff = 8, -- scrolloff
	updatetime = 250, -- faster completion
	timeoutlen = 300, -- faster timeout
	-- disable statusline
	-- laststatus = 0,
	showmode = false,
	ruler = false,
	-- disable swap file
	swapfile = false,
	-- set conceallevel
	conceallevel = 2,
}

for opt, value in pairs(options) do
	vim.opt[opt] = value
end
