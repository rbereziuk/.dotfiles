" These functions are stored in harpoon
nnoremap <leader>ha :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hm :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>hc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>
nnoremap <leader>ht :lua require("harpoon.term").gotoTerminal(1)<CR>

nnoremap <C-j> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-k> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-l> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-;> :lua require("harpoon.ui").nav_file(4)<CR>
