local api = vim.api

local help_in_tab_group = api.nvim_create_augroup('HelpInTabs', { clear = true})

api.nvim_create_autocmd('BufEnter', {
  group = help_in_tab_group,
  pattern = '*.txt',
  callback = function()
    local buftype = api.nvim_get_option_value('buftype', { scope = 'local'} )
    if buftype == 'help' then
      api.nvim_command('execute "normal \\<C-W>T"')
    end
  end
})
