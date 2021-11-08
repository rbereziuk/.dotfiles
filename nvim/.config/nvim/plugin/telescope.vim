nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>ft <cmd>Telescope tags<CR>
nnoremap <Leader>fdf <cmd>lua require'telescope.builtin'.git_files{ cwd = "~/.dotfiles/" }<CR>
nnoremap <Leader>fa <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/", hidden = true }<CR>

