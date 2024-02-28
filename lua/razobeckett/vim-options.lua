local o = vim.opt

-- line wrapping
o.wrap = false

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
o.expandtab = true
o.autoindent = true

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
o.iskeyword:append("-") -- the dash(-) will be considered as part of the word
o.undofile = true       -- undo persistence
o.scrolloff = 8         -- scrolloff
o.updatetime = 250      -- faster completion
o.timeoutlen = 300

-- show invisible characters
o.list = true
o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

