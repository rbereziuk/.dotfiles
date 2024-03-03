require('auto-hlsearch').setup()
--require "lsp_signature".setup()

require('ibl').setup({
  exclude = {
    filetypes = { 'startify' },
  },
})
--vim.cmd [[highlight IndentBlanklineChar guifg=#27283F gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineChar guifg=#1D1E2F gui=nocombine]]
