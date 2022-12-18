local keymap = vim.keymap

--vim.g.mapleader = ','
vim.g.mapleader = ' '

keymap.set('i', 'df', '<Esc>')
keymap.set('n', '<leader>w', ':w<CR>')
keymap.set('n', '<C-s>', ':w<CR>')

keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')

-- Keys from Prime ---
---------------------
-- Move selected text
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

