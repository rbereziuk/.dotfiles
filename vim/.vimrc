" vim:fdm=marker

"===== 📌 PLUGINS DEFINITION ===== {{{

"Automatic installation of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/goyo.vim'
  Plug 'gruvbox-community/gruvbox'
  Plug 'ayu-theme/ayu-vim'
  Plug 'haishanh/night-owl.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ap/vim-css-color'
  Plug 'sheerun/vim-polyglot'
  Plug 'machakann/vim-highlightedyank'

  Plug 'pangloss/vim-javascript'
"Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "On-demand loading
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'tpope/vim-vinegar'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'justinmk/vim-sneak'
  Plug 'easymotion/vim-easymotion'
  Plug 'liuchengxu/vim-clap'
  " Build the extra binary if cargo exists on your system.
  Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "Plug 'valloric/youcompleteme'
  Plug 'sirver/ultisnips'
  Plug 'honza/vim-snippets'
  "Plug 'ervandew/supertab'
  Plug 'mattn/emmet-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
 
  Plug 'sjl/gundo.vim'
  "Plug 'liuchengxu/vista.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/vim-easy-align'

  "Other
  "Plug 'yggdroot/indentline'
  "Plug 'mileszs/ack.vim'
  "Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

call plug#end()

" }}}

"===== 📌 SETTINGS ===== {{{
syntax on
colorscheme gruvbox
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
set background=dark
set t_Co=256 "For lightline plugin force 256 terminal colors

set encoding=utf-8 "Required by youcompleteme plugin

" Enable 24bit true color for night owl colorscheme
if (has("termguicolors"))
 set termguicolors
endif

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"set termguicolors

set number relativenumber
set tabstop=2 shiftwidth=2 expandtab
set incsearch
set hlsearch "Hightlight all search results
set splitbelow splitright "Natural split appearance
set ignorecase "Need for smartcase
set smartcase "Ignore case when all letters lower
set wildmenu "Show a menu when using tab completion
set showcmd "Show (partial) command on the right side of last line on the screen
set scrolloff=5 "Padding if press z-enter
set cursorline
set hidden "Allow change edited buffer
set backspace=indent,eol,start "Make backspace behave like in every other editor
set noshowmode "Disable vim text insert mode indicator on bottom statusBar
set signcolumn=yes "enable an additional column beside line numbers
set noerrorbells visualbell "Disable ennoing bell sound
"set t_vb= "part of settings to disable ennoing bell

set mouse=a "enable all mouse actions
set ttymouse=xterm2 "allow mouse inside tmux

"Set cursor icons for different vim modes
let &t_SI = "\<esc>[5 q"   "I beam cursor for insert mode
let &t_EI = "\<esc>[2 q"   "block cursor for normal mode
let &t_SR = "\<esc>[3 q"   "Underline cursor for replace mode

"GUI => :help guioptions
if has("gui_macvim")
  set macligatures "enable nice font icon for ->
  set guifont=Fira_Code:h17
  set linespace=3 "line-height
  "Remove gui scrollbars
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
  set guioptions-=e "Disable GUI tabs
endif

" 🔬 Search more information about this options
"set lazyredraw "redraw only when we need to

"-- FOLDING --
"set foldenable "enable folding for convenience reading code
"set foldmethod=indent "fold based on indent level
"set foldlevelstart=10 "open most folds by default
"set foldnestmax=10 "10 nested fold max
"" space open/close folds
"nnoremap <space> za

"set foldmethod=syntax "syntax highlighting items specify folds
"set foldcolumn=1 "defines 1 col at window left, to indicate folding
"let javaScript_fold=1 "activate folding by JS syntax
"set foldlevelstart=99 "start file with all folds opened
"autocmd FileType javascript setlocal foldmethod=expr

"filetype plugin on
"filetype indent plugin on
"set completeopt+=popup          "some problem of scratch buffer 
"set completeopt-=preview
"set autoread                    "reload file if changed outside vim after some actions :checktime :diffupdate
"set shortmess-=S
"Search down into subfolders 
"set path+=**                    "Provides tab-completion for all file-related tasks

"}}}

" ===== 📌 PLUGINS SETTINGS ===== {{{

"NERDTree {{{
let NERDTreeShowHidden=1 "Display hidden files
let NERDTreeHijackNetrw = 0 "Fix compability with vim-vinegar
let g:NERDTreeIgnore = ['^node_modules$', '.git']
"}}}

"CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "ignore gitignore files
let g:ctrlp_custom_ignore = 'Books\|node_modules\|Books\|Videos\|Pictures\|Documents\|Music\|Zotero\|Calibre\ Library'
"let g:ctrlp_match_window = 'top'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <Leader>b :CtrlPBuffer<CR>

"fzf
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let $FZF_DEFAULT_OPTS= '--layout=reverse'

"vim-sneak
let g:sneak#label = 1 "add easymotion feature
let g:sneak#use_ic_scs = 1 "case insensitive sneak
"let g:sneak#prompt = '🔎 '

"airline
let g:airline_theme='gruvbox' "Airline theme (change from badwolf)
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1 "displays buffers when there's only one tab open
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#formatter = 'unique_tail' "file name without path in name
let g:airline#extensions#tabline#show_close_button = 0 "remove 'X' at the end of the tabline

" In focus easy to close
let g:gitgutter_close_preview_on_escape=1

"Testing snippets
let g:UltiSnipsExpandTrigger="<leader><leader>s"

"Gundo
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

" }}}

"===== 📌 MAPPINGS ===== {{{

"General
let mapleader=","
inoremap df <ESC>
map <leader>w :w!<CR>
nnoremap <leader><space> :nohlsearch<CR>
"Make it easy to edit the vimrc file
nmap <leader>ev :tabedit $MYVIMRC<cr>
"Hide search hightlights
nmap <silent> <BS> :nohlsearch<CR>

vnoremap <leader>p "_dP

"Specific app maps
map <leader>rn :w\|:!node %<cr>
map <leader>rp :w\|:!python3 %<cr>

"Better split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nmap <leader>c :q<cr>
" nnoremap / /\v

"Use arrow keys to navigate after a :vimgrep or :helpgrep
nmap <silent> <RIGHT>         :cnext<CR>
nmap <silent> <RIGHT><RIGHT>  :cnfile<CR><C-G>
nmap <silent> <LEFT>          :cprev<CR>
nmap <silent> <LEFT><LEFT>    :cpfile<CR><C-G>

"NERDTree
map <C-n> :NERDTreeToggle<CR>

"EasyMotion
"map <Leader> <Plug>(easymotion-prefix)

"Gundo: toggle
nnoremap <leader>u :GundoToggle<CR>

"Zettelkasten (цетелькастен)
"Go to index of notes and set working directory to my notes
"nnoremap <leader>ni :e $NOTES_DIR/index.md<CR>:cd $NOTES_DIR<CR>

" 🧪 TESTING NEW MAPPINGS
" save some strokes
nnoremap ; :
vnoremap ; :

"Paste last thing yanked, not deleted
nmap <leader>p "0p
nmap <leader>P "0P

map <leader>g :Tag<CR>

"}}}

"===== 📌 AUTO-COMMANDS ===== {{{

"Automatically source the vimrc file on save
"autocmd! clear previous group
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

"autocmd Filetype css,sass,scss set iskeyword+=-
"autocmd BufRead *.json :Prettier<cr> :write
"autocmd BufWrite *.js :Prettier<cr> :write

"}}}

"===== 📌 HELPERS ===== {{{

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

"}}}

"===== 📌 LANGUAGE ===== {{{

"Set ukraine in insert mode for easy typing
"set keymap=ukrainian-jcuken
set keymap=ukrainian-enhanced
set imsearch=0
set iminsert=0 " щоб дефолтним методом в insert/search mode була англійська

"}}}

"===== 📌 Coc ===== {{{
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile

"}}}

"===== 📌 NOTES AND TIPS ===== {{{

"Absolute disable arrow keys (for training goal)
"noremap <left> <nop>
"noremap <right> <nop>
"noremap <up> <nop>
"noremap <down> <nop>

""Better change windows
""Create new window in direction where window doesn't exist
"function! WinMove(key)
"  let t:curwin = winnr()
"  exec "wincmd ".a:key
"  if (t:curwin == winnr())
"    if (match(a:key,'[jk]'))
"      wincmd v
"    else
"      wincmd s
"    endif
"    exec "wincmd ".a:key
"  endif
"endfunction

"map <silent> <C-h> :call WinMove('h')<CR>
"map <silent> <C-j> :call WinMove('j')<CR>
"map <silent> <C-k> :call WinMove('k')<CR>
"map <silent> <C-l> :call WinMove('l')<CR>

" CtrlP auto cache clearing.
"function! SetupCtrlP()
"  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
"    augroup CtrlPExtension
"      autocmd!
"      autocmd FocusGained  * CtrlPClearCache
"      autocmd BufWritePost * CtrlPClearCache
"    augroup END
"  endif
"endfunction
"if has("autocmd")
"  autocmd VimEnter * :call SetupCtrlP()
"endif
"
"
"let g:SuperTabClosePreviewOnPopupClose = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"
""emmet
"let g:user_emmet_settings = {
"\  'javascript' : {
"\      'extends' : 'jsx',
"\  },
"\}
"
""Super tab settings for natural tab completion
"let g:SuperTabDefaultCompletionType    = '<C-n>'
"let g:SuperTabCrMapping                = 0
"let g:UltiSnipsExpandTrigger           = '<tab>'
"let g:UltiSnipsJumpForwardTrigger      = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
"let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
"
"
"let g:gitgutter_enabled = 0 "Turn off vim-gitgutter by default
"let g:indentLine_enabled = 0 "Disable indent line by default

" }}}

"===== 📌 OTHER ===== {{{

"Some replace for ctrlp
"nnoremap <silent> <leader>e :call Fzf_dev()<CR>

" ripgrep
"if executable('rg')
"  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
"  set grepprg=rg\ --vimgrep
"  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
"endif
"
"" Files + devicons
"function! Fzf_dev()
"  let l:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'
"
"  function! s:files()
"    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
"    return s:prepend_icon(l:files)
"  endfunction
"
"  function! s:prepend_icon(candidates)
"    let l:result = []
"    for l:candidate in a:candidates
"      let l:filename = fnamemodify(l:candidate, ':p:t')
"      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
"      call add(l:result, printf('%s %s', l:icon, l:candidate))
"    endfor
"
"    return l:result
"  endfunction
"
"  function! s:edit_file(item)
"    let l:pos = stridx(a:item, ' ')
"    let l:file_path = a:item[pos+1:-1]
"    execute 'silent e' l:file_path
"  endfunction
"
"  call fzf#run({
"        \ 'source': <sid>files(),
"        \ 'sink':   function('s:edit_file'),
"        \ 'options': '-m ' . l:fzf_files_options,
"        \ 'down':    '40%' })
"endfunction

"}}}

