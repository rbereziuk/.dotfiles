require('core.global_settings')
require('core.keymaps')
require('core.plugins')
require('core.plugin_configs')
require('core.autocmd')

--require("toggleterm").setup{
--    float_opts = {
--    -- The border key is *almost* the same as 'nvim_open_win'
--    -- see :h nvim_open_win for details on borders however
--    -- the 'curved' border is a custom border type
--    -- not natively supported but implemented in this plugin.
--    border = 'single',
--    -- like `size`, width and height can be a number or function which is passed the current terminal
--    width = 170,
--    height = 70,
--    winblend = 3,
--  }
--}

--local Terminal  = require('toggleterm.terminal').Terminal
--local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, size = 50, direction = 'float' })
--
--function _lazygit_toggle()
--  lazygit:toggle()
--end
--
--vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
