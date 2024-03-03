-- Move text to center
-- 0 means current window
local width_ratio = vim.fn.winwidth(0)
vim.g.startify_padding_left = math.ceil(width_ratio / 3)

vim.g.startify_change_to_vcs_root = 1

vim.g.ascii_neovim = {
  ' ⠀⠀⠀⠀⣠⣶⡾⠏⠉⠙⠳⢦⡀⠀⠀⠀⢠⠞⠉⠙⠉⠙⠲⡀⠀',
  ' ⠀⠀⠀⣴⠿⠏⠀⠀⠀⠀⠀⠀ ⢳⡀⠀⡏⠀⠀⠀⠀ ⠀   ⢷',
  ' ⠀⠀⢠⣟⣋⡀⢀⣀⣀⡀⠀⣀⡀⣧⠀⢸⠀⠀let`s   ⡇',
  ' ⠀⠀⢸⣯⡭⠁⠸⣛⣟⠆⡴⣻⡲⣿⠀⣸⠀⠀ have ⠀ ⡇',
  ' ⠀⠀⣟⣿⡭⠀⠀⠀⠀⠀⢱⠀⠀ ⣿⠀⢹⠀⠀ fun?  ⡇',
  ' ⠀⠀⠙⢿⣯⠄⠀⠀⠀⢀⡀⠀⠀⡿⠀⠀⡇⠀⠀⠀⠀    ⡼',
  ' ⠀⠀⠀⠀⠹⣶⠆⠀⠀⠀⠀⠀⡴⠃⠀⠀⠘⠤⣄⣠⣄⣠⣄⠞⠀',
  ' ⠀⠀⠀⠀⠀⢸⣷⡦⢤⡤⢤⣞⣁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  ' ⠀⠀⢀⣤⣴⣿⣏⠁⠀⠀⠸⣏⢯⣷⣖⣦⡀⠀⠀⠀⠀⠀⠀',
  ' ⢀⣾⣽⣿⣿⣿⣿⠛⢲⣶⣾⢉⡷⣿⣿⠵⣿⠀⠀⠀⠀⠀⠀',
  ' ⣼⣿⠍⠉⣿⡭⠉⠙⢺⣇⣼⡏⠀⠀⠀⣄⢸⠀⠀⠀⠀⠀⠀',
  ' ⣿⣿⣧⣀⣿.........⣀⣰⣏⣘⣆⣀⠀',
}
vim.g.startify_change_cmd = 'cd'

vim.g.startify_custom_header_quotes = {
  { 'I... a universe of atoms, an atom in the universe.', '', '― Richard P. Feynman' },
  { 'Control of consciousness determines the quality of life.', '', '― Mihaly Csikszentmihalyi' },
  { 'He was going to live forever, or die in the attempt.', '', '— Joseph Heller' },
}

vim.g.startify_custom_header = 'startify#center(g:ascii_neovim) + startify#center(startify#fortune#boxed())'
