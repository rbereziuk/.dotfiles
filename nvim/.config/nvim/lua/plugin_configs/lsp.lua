-- Setup language servers.
local lspconfig = require('lspconfig')


local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}

-- LSP settings (for overriding per client)
local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}



require'lspconfig'.eslint.setup{}
lspconfig.pyright.setup {}
--lspconfig.gopls.setup{}
--
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.html.setup{
  capabilities = capabilities,
}
require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

lspconfig.ts_ls.setup({
  capabilities = capabilities,
  handlers = handlers
})

--lspconfig.emmet_ls.setup{}
lspconfig.emmet_language_server.setup({})

lspconfig.tailwindcss.setup{}
----lspconfig.marksman.setup{}

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the 'vim' global
        globals = { 'vim', 'love' },
      },
    },
  },
})

lspconfig.bashls.setup({})

require'lspconfig'.prismals.setup{}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = 'Open float' })
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Next diagnostic' })
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Prev diagnostic' })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space><space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space><space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rs', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'Rename symbol' })
    --vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

--vim.diagnostic.config({
--  signs = {
--    text = {
--      [vim.diagnostic.severity.ERROR] = ' ',
--      [vim.diagnostic.severity.WARN] = ' ',
--      [vim.diagnostic.severity.INFO] = ' ',
--      [vim.diagnostic.severity.HINT] = ' ',
--    },
--  },
--})

--vim.diagnostic.config({
--  signs = {
--    text = {
--      [vim.diagnostic.severity.ERROR] = '✘',
--      [vim.diagnostic.severity.WARN] = '▲',
--      [vim.diagnostic.severity.HINT] = '⚑',
--      [vim.diagnostic.severity.INFO] = '»',
--    },
--  },
--})

-- https://github.com/folke/trouble.nvim/issues/52
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


