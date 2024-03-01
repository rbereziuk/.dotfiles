-- load snippets from path/of/your/nvim/config/my-cool-snippets
require('luasnip.loaders.from_vscode').lazy_load({ paths = { './vscode-snippets' } })

---require('luasnip.loaders.from_lua').lazy_load({ paths = '~/.config/nvim/snippets/' })
require('luasnip.loaders.from_lua').lazy_load({ paths = './snippets' })

local ls = require('luasnip').setup({
  --region_check_events = { 'CursorMoved' }
  delete_check_events = 'TextChanged'
})

-- This will expand the current item or jump to the next item wihin the snippet
--vim.keymap.set({ "i", "s" }, "<tab>", function()
--  if ls.expand_or_jumpable() then
--    return '<Plug>luasnip-expand-or-jump'
--  else
--    return '<Tab>'
--  end
--end, { silent = true, expr = true })

vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '*',
  callback = function()
    if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
        and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require('luasnip').session.jump_active
    then
      require('luasnip').unlink_current()
    end
  end
})
