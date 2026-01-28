return {
  'hrsh7th/nvim-cmp', -- Autocompletion plugin
  version = false, -- last release is way too old
  --event = 'InsertEnter',
  -- these dependencies will only be loaded when cmp loads
  -- dependencies are always lazy-loaded unless specified otherwise
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
    'hrsh7th/cmp-buffer',
    --'hrsh7th/cmp-path',
    -- additional dependencies for snippets
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip'
  },
  config = function()
    local cmp = require'cmp'
    require('cmp').setup({
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
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
      },
    })
  end
  -- alternative config option from lazyvim
  -- opts = function()
  --   local cmp = require('cmp')
  --   return {
  --     snippet = {
  --       -- REQUIRED - you must specify a snippet engine
  --       expand = function(args)
  --         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  --       end,
  --     },
  --   }
  -- end
}
