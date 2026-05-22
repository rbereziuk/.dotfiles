return {
  --enabled = false,
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  --commit = vim.fn.has("nvim-0.12") == 0 and "7caec274fd19c12b55902a5b795100d21531391f" or nil,
  build = ':TSUpdate',
  config = function()
    local treesitter = require("nvim-treesitter")

    -- Install parsers
    treesitter.install({ 'html', 'css', 'javascript', 'typescript', 'tsx' })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'html', 'css', 'javascript', 'typescript', 'tsx' },
      callback = function() vim.treesitter.start() end,
    })
  end,
}

-- return {
--   name = 'treesitter',
--   branch = 'master',
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
