return {
  'hrsh7th/nvim-cmp', -- Autocompletion plugin

  -- these dependencies will only be loaded when cmp loads
  -- dependencies are always lazy-loaded unless specified otherwise
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
    'hrsh7th/cmp-buffer',
  },
  config = function()
    local cmp = require'cmp'

    require('cmp').setup({
      -- snippet = {
      --   -- REQUIRED - you must specify a snippet engine
      --   expand = function(args)
      --     require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      --   end,
      -- },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert(),
      sources = {
        --{ name = 'luasnip' },
        { name = 'nvim_lsp' },
        --{ name = 'buffer' },
      },
    })
  end
}
