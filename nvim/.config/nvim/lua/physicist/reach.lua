require('reach').setup({
  notifications = false
})


local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<leader>b', ":lua require('reach').buffers({ auto_exclude_handles = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'}})<CR>", opts)

