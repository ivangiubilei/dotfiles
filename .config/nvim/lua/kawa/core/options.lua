vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.number = true
opt.relativenumber = true

-- tabs and indentation
opt.tabstop = 2 -- 2 spaces per tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tabs to spaces
opt.autoindent = true

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true -- TODO da vedere

-- gui
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent

-- clipboard
opt.clipboard:append("unnamedplus") -- sys clipboard as default register

-- split
opt.splitright = true
opt.splitbelow = true

-- history
opt.history = 100
