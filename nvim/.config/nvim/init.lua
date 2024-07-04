if vim.g.vscode then
  require('vs_code')
else
  require('options')
  require('keymaps')
  require('utils')
  require('plugins')
  require('plugin_configs')
  require('autocmd')
end
