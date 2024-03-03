if !exists('g:vscode')

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

let g:startify_custom_header_quotes = [
      \ ['I... a universe of atoms, an atom in the universe.', '', '― Richard P. Feynman'],
      \ ['Control of consciousness determines the quality of life.', '', '― Mihaly Csikszentmihalyi'],
      \ ['He was going to live forever, or die in the attempt.', '', '— Joseph Heller'],
      \ ]
"let g:startify_custom_header = g:ascii + startify#fortune#boxed()
let g:startify_custom_header = startify#center(g:ascii) + startify#center(startify#fortune#boxed())


endif
