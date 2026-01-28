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
