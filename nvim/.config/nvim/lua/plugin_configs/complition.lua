-- Set up nvim-cmp.
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping(function(fallback)
      --if cmp.visible() then
      if cmp.visible() and not luasnip.expand_or_jumpable() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      --if luasnip.expand_or_jumpable then
      --  luasnip.expand_or_jump()
      --elseif luasnip.expand_or_jumpable() then
      --  cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
  --  sources = cmp.config.sources({
  --    { name = 'nvim_lsp' },
  --    { name = 'luasnip' }, -- For luasnip users.
  --  }, {
  --    { name = 'buffer' },
  --  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      --with_text = false,
      --maxwidth = 50
    }),
  },
})

---- Set configuration for specific filetype.
--cmp.setup.filetype('gitcommit', {
--  sources = cmp.config.sources({
--    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--  }, {
--    { name = 'buffer' },
--  })
--})
--
---- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline({ '/', '?' }, {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = {
--    { name = 'buffer' }
--  }
--})
--
---- Set up lspconfig.
--local capabilities = require('cmp_nvim_lsp').default_capabilities()
---- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['ts_ls'].setup {
--  capabilities = capabilities
--}
