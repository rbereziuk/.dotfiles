lua << EOF
require'telescope'.setup {
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
  },
}

require('telescope').load_extension('media_files')

EOF
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>ft <cmd>Telescope tags<CR>
nnoremap <Leader>fdf <cmd>lua require'telescope.builtin'.git_files{ cwd = "~/.dotfiles/" }<CR>
nnoremap <Leader>fa <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/", hidden = true }<CR>

