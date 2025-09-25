-- local border = {
--   { '🭽', 'FloatBorder' },
--   { '▔', 'FloatBorder' },
--   { '🭾', 'FloatBorder' },
--   { '▕', 'FloatBorder' },
--   { '🭿', 'FloatBorder' },
--   { '▁', 'FloatBorder' },
--   { '🭼', 'FloatBorder' },
--   { '▏', 'FloatBorder' },
-- }

-- -- LSP settings (for overriding per client)
-- local handlers =  {
--   ['textDocument/hover'] =  vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
--   ['textDocument/signatureHelp'] =  vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
-- }
--

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev Diagnostic' })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Goto Definition' })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
    vim.keymap.set('n', '<leader>rs', vim.lsp.buf.rename, { desc = 'Rename Symbol' })
  end
})

return {
  'neovim/nvim-lspconfig',
  config = function()
    vim.lsp.config('ts_ls', {
       handlers = handlers,
       capabilities = capabilities
    })
    vim.lsp.enable('ts_ls')
    -- vim.lsp.config.ts_ls.setup{
    --   handlers = handlers,
    --   capabilities = capabilities
    -- }
    -- require'lspconfig'.eslint.setup{}
    --
    -- require'lspconfig'.html.setup {
    --   capabilities = capabilities,
    -- }
    vim.lsp.config('html', {
      --capabilities = capabilities,
    })
    vim.lsp.enable('html')
    vim.lsp.enable('emmet_ls')

    local base_on_attach = vim.lsp.config.eslint.on_attach
    vim.lsp.config("eslint", {
      on_attach = function(client, bufnr)
        if not base_on_attach then return end

        base_on_attach(client, bufnr)
        vim.api.nvim_create_autocmd('BufWritePre', {
          buffer = bufnr,
          command = 'LspEslintFixAll',
        })
      end,
    })
    vim.lsp.enable('eslint')
    --vim.lsp.enable('html')
  end
}
