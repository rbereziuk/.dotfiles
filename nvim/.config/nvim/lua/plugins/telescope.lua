return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8', 
  -- or                          , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      prompt_prefix = '🔭 ',
      selection_caret = ' ',
      layout_config = {
        prompt_position = 'top',
      },
      sorting_strategy = 'ascending',
    }
  },
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Find Text' }
  }
}
