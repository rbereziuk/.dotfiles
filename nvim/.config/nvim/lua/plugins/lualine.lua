return {
  'nvim-lualine/lualine.nvim',
  event = "VeryLazy",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'tokyonight',
      globalstatus = true,
      --section_separators = '',
      --component_separators = '',
    }
  }
}
