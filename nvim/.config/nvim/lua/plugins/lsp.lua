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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Goto Definition' })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
  end
})

return {
  'neovim/nvim-lspconfig',
  config = function()
    require'lspconfig'.ts_ls.setup{
      handlers = handlers,
      capabilities = capabilities
    }
    require'lspconfig'.eslint.setup{}
  end
}
