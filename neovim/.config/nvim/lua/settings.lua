local o = vim.o     -- global options
local wo = vim.wo   -- window options
local bo = vim.bo   -- buffer options
local cmd = vim.cmd -- user defined commands

-- global options
o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
o.encoding = 'utf-8'
o.updatetime = 300
o.termguicolors = false

-- window-local options
wo.number = true
wo.relativenumber = true
wo.wrap = false
wo.cursorline = true
wo.signcolumn = 'yes'

-- buffer-local options
bo.expandtab = true 
bo.tabstop = 4
bo.softtabstop = 4
bo.shiftwidth = 4

cmd 'colorscheme codedark'
cmd 'filetype plugin indent on'
