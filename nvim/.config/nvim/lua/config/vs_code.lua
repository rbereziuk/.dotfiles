vim.g.mapleader = ' '

-- Mapping
vim.keymap.set('n', '<leader>fe', '<Cmd>call VSCodeNotify("workbench.action.toggleSidebarVisibility")<CR>')
vim.keymap.set('n', '<leader>ff', '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>')
