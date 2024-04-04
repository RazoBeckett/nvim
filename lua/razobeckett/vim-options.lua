local o = vim.opt

-- line wrapping
o.wrap = false

-- encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- show invisible characters
o.list = true
o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- line numbers
o.number = true
o.relativenumber = true

-- search options
o.ignorecase = true
o.smartcase = true
o.cursorline = true
o.hlsearch = true
o.incsearch = true

-- tab and indentation
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 0
o.smarttab = true
o.expandtab = true
o.autoindent = true
o.breakindent = true

-- appearance
o.termguicolors = true
o.background = "dark"
o.signcolumn = "yes"

-- backspace key
o.backspace = "indent,eol,start"

-- clipboard
o.clipboard:append("unnamedplus")

-- slip window
o.splitright = true
o.splitbelow = true

-- misc.
o.iskeyword:append("-")              -- the dash(-) will be considered as part of the word
o.undofile = true                    -- undo persistence
o.scrolloff = 8                      -- scrolloff
o.updatetime = 250                   -- faster completion
o.timeoutlen = 300                   -- faster timeout
vim.cmd("let g:netrw_banner = 0")    -- disable netrw banner
vim.cmd("let g:netrw_liststyle = 3") -- netrw list style

-- disable statusline
o.laststatus = 0
o.showmode = false
o.ruler = false
