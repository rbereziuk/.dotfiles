local border = {
  { '🭽', 'FloatBorder' },
  { '▔', 'FloatBorder' },
  { '🭾', 'FloatBorder' },
  { '▕', 'FloatBorder' },
  { '🭿', 'FloatBorder' },
  { '▁', 'FloatBorder' },
  { '🭼', 'FloatBorder' },
  { '▏', 'FloatBorder' },
}

-- LSP settings (for overriding per client)
local handlers =  {
  ['textDocument/hover'] =  vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ['textDocument/signatureHelp'] =  vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

return {
  'neovim/nvim-lspconfig',
  config = function()
    require'lspconfig'.ts_ls.setup{
      handlers = handlers
    }
    require'lspconfig'.eslint.setup{}
  end
}
