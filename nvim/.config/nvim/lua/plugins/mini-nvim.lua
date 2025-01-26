return {
  'echasnovski/mini.nvim', version = false,
  enabled = false,
  config = function()
    --require('mini.pairs').setup()
    require('mini.indentscope').setup()
  end
}
