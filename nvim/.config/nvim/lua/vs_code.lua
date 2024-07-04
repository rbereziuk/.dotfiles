local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-surround',
})

-- Mapping
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>fe', '<Cmd>call VSCodeNotify("workbench.action.toggleSidebarVisibility")<CR>')
vim.keymap.set('n', '<leader>ff', '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>')
