local ls = require('luasnip')

require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/snippets/' })
require("luasnip.loaders.from_vscode").load({paths = "~/.config/nvim/vscode-snippets"})

ls.config.set_config({
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  -- keep around last snippet local to jump back
  history = true,

  -- Update changes as you type (when using function)
  updateevents = 'TextChanged,TextChangedI',

  -- Autosnippets:
  enable_autosnippets = true,

  ext_opts = {
    [require('luasnip.util.types').choiceNode] = {
      active = {
        virt_text = { { "●", "GruvboxOrange" } },
      }
    }
  }
})

-- This will expand the current item or jump to the next item wihin the snippet
vim.keymap.set({ "i", "s" }, "<tab>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- This always moves to the previous item within the snippet
vim.keymap.set({ "i" , "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true})


