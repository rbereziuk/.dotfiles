return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local treesitter = require("nvim-treesitter")

    -- Install parsers
    treesitter.install({ "javascript", "typescript", "tsx" })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'javascript', 'typescript', 'tsx' },
      callback = function() vim.treesitter.start() end,
    })
  end,
}

-- return {
--   name = 'treesitter-old',
--   'nvim-treesitter/nvim-treesitter',
--   build = ':TSUpdate',
--   opts = {
--     ensure_installed = {
--       'html',
--       'javascript',
--       'lua',
--       'tsx',
--       'typescript',
--     },
--     highlight = { enable = true },
--   },
--   config = function(_, opts)
--     require('nvim-treesitter.configs').setup(opts)
--   end
-- }
