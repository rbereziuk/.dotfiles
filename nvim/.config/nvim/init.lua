if vim.g.vscode then
  require('vscode')
else
  require('global_settings')
  require('keymaps')
  require('plugins')
  require('plugin_configs')
  require('autocmd')
end

