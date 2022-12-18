let g:startify_change_to_vcs_root = 1
let g:startify_change_cmd = 'cd'


"let g:startify_custom_header = 'startify#pad(startify#fortune#cowsay())'

let width_ratio = winwidth(0)
let g:startify_padding_left = width_ratio / 3

let g:ascii = [
      \ ' ⠀⠀⠀⠀⣠⣶⡾⠏⠉⠙⠳⢦⡀⠀⠀⠀⢠⠞⠉⠙⠉⠙⠲⡀⠀',
      \ ' ⠀⠀⠀⣴⠿⠏⠀⠀⠀⠀⠀⠀ ⢳⡀⠀⡏⠀⠀⠀⠀ ⠀   ⢷',
      \ ' ⠀⠀⢠⣟⣋⡀⢀⣀⣀⡀⠀⣀⡀⣧⠀⢸⠀⠀let`s   ⡇',
      \ ' ⠀⠀⢸⣯⡭⠁⠸⣛⣟⠆⡴⣻⡲⣿⠀⣸⠀⠀ have ⠀ ⡇',
      \ ' ⠀⠀⣟⣿⡭⠀⠀⠀⠀⠀⢱⠀⠀ ⣿⠀⢹⠀⠀ fun?  ⡇',
      \ ' ⠀⠀⠙⢿⣯⠄⠀⠀⠀⢀⡀⠀⠀⡿⠀⠀⡇⠀⠀⠀⠀    ⡼',
      \ ' ⠀⠀⠀⠀⠹⣶⠆⠀⠀⠀⠀⠀⡴⠃⠀⠀⠘⠤⣄⣠⣄⣠⣄⠞⠀',
      \ ' ⠀⠀⠀⠀⠀⢸⣷⡦⢤⡤⢤⣞⣁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      \ ' ⠀⠀⢀⣤⣴⣿⣏⠁⠀⠀⠸⣏⢯⣷⣖⣦⡀⠀⠀⠀⠀⠀⠀',
      \ ' ⢀⣾⣽⣿⣿⣿⣿⠛⢲⣶⣾⢉⡷⣿⣿⠵⣿⠀⠀⠀⠀⠀⠀',
      \ ' ⣼⣿⠍⠉⣿⡭⠉⠙⢺⣇⣼⡏⠀⠀⠀⣄⢸⠀⠀⠀⠀⠀⠀',
      \ ' ⣿⣿⣧⣀⣿.........⣀⣰⣏⣘⣆⣀⠀'
      \]

"let g:startify_custom_header = g:ascii + startify#fortune#boxed()
let g:startify_custom_header = startify#center(g:ascii) + startify#center(startify#fortune#boxed())
