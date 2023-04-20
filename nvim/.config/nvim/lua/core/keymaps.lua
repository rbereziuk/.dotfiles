local keymap = vim.keymap

vim.g.mapleader = ' '

keymap.set('i', 'df', '<Esc>')

-- Save file
keymap.set('n', '<leader>w', '<cmd>w<CR>', { noremap = true, silent = true, desc = 'Save' })
keymap.set({ 'n', 'i', 'v', 's' }, '<C-s>', '<cmd>w<CR><esc>', { noremap = true, silent = true, desc = 'Save file' })

keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')

-- Move selected text
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

