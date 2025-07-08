return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'javascript',
      'tsx',
      'typescript',
      'html',
    },
    highlight = { enable = true },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end
}
