-- disable netrw at the very start of your init.lua (strongly advised)
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

require('neo-tree').setup({
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_by_name = {
        '.git'
      }
    },
    follow_current_file = true
  }
})

vim.keymap.set('n', '<leader>fe', ':Neotree toggle<CR>', { silent = true })
