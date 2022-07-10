" ------------- 💊 HELPERS ------------- {{{

"Make :help appear in a full-screen tab, instead of a window
"Only apply to .txt files...
augroup HelpInTabs
  autocmd!
  autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END
"Only apply to help files...
function! HelpInNewTab ()
  if &buftype == 'help'
    "Convert the help window to a tab...
    execute "normal \<C-W>T"
  endif
endfunction

" }}}
