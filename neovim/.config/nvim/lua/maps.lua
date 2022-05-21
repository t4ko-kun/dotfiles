local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables


options = { noremap = true }
-- touch type friendly motion
map('n', 'h', '', options)
map('n', 'j', 'h', options)
map('n', 'k', 'j', options)
map('n', 'l', 'k', options)
map('n', ';', 'l', options)

map('v', 'h', '', options)
map('v', 'j', 'h', options)
map('v', 'k', 'j', options)
map('v', 'l', 'k', options)
map('v', ';', 'l', options)

-- stay in visual mode when indenting blockwise
map('v', '>', '>gv', options)
map('v', '<', '<gv', options)

