require("toggleterm").setup{
    float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'single',
    -- like `size`, width and height can be a number or function which is passed the current terminal
    width = 170,
    height = 50,
    winblend = 3,
  }
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, size = 45, direction = 'float' })


function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>ToggleTerm size=45 direction=float<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
