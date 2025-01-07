local keymap = vim.keymap

keymap.set('i', 'df', '<Esc>')

-- Save file
keymap.set('n', '<leader>w', '<cmd>w<CR>', { noremap = true, silent = true, desc = 'Save' })
--keymap.set({ 'n', 'i', 'v', 's' }, '<C-s>', '<cmd>w<CR><esc>', { noremap = true, silent = true, desc = 'Save file' })