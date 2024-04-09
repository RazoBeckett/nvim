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
	softtabstop = 0,
	smarttab = true,
	expandtab = true,
	autoindent = true,
	breakindent = true,
	--appearance
	termguicolors = true,
	background = "dark",
	signcolumn = "yes",
	--backspace key
	backspace = "indent,eol,start",
	--slip window
	splitright = true,
	splitbelow = true,
	--misc.
	undofile = true, -- undo persistence
	scrolloff = 8, -- scrolloff
	updatetime = 250, -- faster completion
	timeoutlen = 300, -- faster timeout
	-- disable statusline
	laststatus = 0,
	showmode = false,
	ruler = false,
	-- disable swap file
	swapfile = false,
}

-- encoding
vim.scriptencoding = "utf-8"

--clipboard
vim.opt.clipboard:append("unnamedplus")
vim.opt.iskeyword:append("-") -- the dash(-) will be considered as part of the word

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

for opt, value in pairs(options) do
	vim.opt[opt] = value
end
