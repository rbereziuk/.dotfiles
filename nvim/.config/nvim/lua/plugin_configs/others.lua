require('auto-hlsearch').setup()
--require "lsp_signature".setup()

require('ibl').setup({
  exclude = {
    filetypes = { 'startify' },
  },
})
--vim.cmd [[highlight IndentBlanklineChar guifg=#27283F gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineChar guifg=#1D1E2F gui=nocombine]]

--require('nvim-ts-autotag').setup()
require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
  per_filetype = {
    ["html"] = {
      enable_close = false
    }
  }
})
