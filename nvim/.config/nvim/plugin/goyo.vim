function! s:goyo_enter()
  set number relativenumber
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()

" Maps
nnoremap <leader>dw :Goyo 60%<CR>
