let g:startify_change_to_vcs_root = 1
let g:startify_change_cmd = 'cd'

"let g:startify_custom_header = 'startify#pad(startify#fortune#cowsay())'

let g:ascii = [
      \ '        __',
      \ '.--.--.|__|.--------.',
      \ '|  |  ||  ||        |',
      \ ' \___/ |__||__|__|__|',
      \ ''
      \]
let g:startify_custom_header = g:ascii + startify#fortune#boxed()
