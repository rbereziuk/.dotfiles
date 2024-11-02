-- Settings from doc
require('telescope').setup({
  defaults = {
    prompt_prefix = '🔭 ',
    selection_caret = ' ',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
  },
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({ find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' } })
end, { desc = 'Find Files' })
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.tags, {})

-- Custom settings
vim.keymap.set('n', '<leader>ec', function()
  builtin.git_files({ cwd = '~/.dotfiles/' })
end)

vim.keymap.set('n', '<leader>fkb', function()
  builtin.find_files({ cwd = '~/Documents/Knowledge-base/' })
end)
