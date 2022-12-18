-- load snippets from path/of/your/nvim/config/my-cool-snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./vscode-snippets" } })

local ls = require('luasnip')

-- This will expand the current item or jump to the next item wihin the snippet
vim.keymap.set({ "i", "s" }, "<tab>", function()
  if ls.expand_or_jumpable() then
    return '<Plug>luasnip-expand-or-jump'
  else
    return '<Tab>'
  end
end, { silent = true, expr = true })

