" vim:fdm=marker
" ------------- 📦 PLUGINS DEFINITION ------------- {{{
call plug#begin(stdpath('data') . '/plugged')

  " --- Browse ---
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-media-files.nvim'

  " --- Motion ---
  Plug 'romainl/vim-cool' "disables search highlighting when you are done searching
  Plug 'ThePrimeagen/harpoon'
  Plug 'wellle/targets.vim'
  Plug 'phaazon/hop.nvim'
  Plug 'preservim/tagbar'

  " --- Code change ---
  Plug 'mattn/emmet-vim'
  Plug 'sbdchd/neoformat'
  Plug 'tpope/vim-surround'
  Plug 'numToStr/Comment.nvim'

  " --- Git ---
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  
  " --- LSP ---
  Plug 'neovim/nvim-lspconfig' "Collection of configurations for built-in LSP client
  Plug 'hrsh7th/nvim-cmp' "Autocompletion plugin
  Plug 'hrsh7th/cmp-nvim-lsp' "LSP source for nvim-cmp
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'onsails/lspkind-nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
  Plug 'nvim-treesitter/playground'
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'nvim-treesitter/nvim-treesitter-context'

  " For vsnip users.
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  " --- Interface ---
  Plug 'mhinz/vim-startify'
  Plug 'digitaltoad/vim-pug'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'junegunn/goyo.vim'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'akinsho/bufferline.nvim'
  Plug 'rcarriga/nvim-notify'

  " --- Colorscheme ---
  Plug 'gruvbox-community/gruvbox'
  Plug 'haishanh/night-owl.vim'
  Plug 'Shatur/neovim-ayu'
  Plug 'sainnhe/sonokai'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'rebelot/kanagawa.nvim'

  " --- Icons ---
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'

  " --- Other ---
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  
  " --- Track statictics ---
  "Plug 'ActivityWatch/aw-watcher-vim'

  " --- TESTING ---
  "Plug 'github/copilot.vim'  
  "Plug 'nvim-orgmode/orgmode'
  "Plug 'toppair/reach.nvim'
  Plug '/home/roman/Lab/stackmap.nvim/'
  Plug 'godlygeek/tabular'
  "Plug 'preservim/vim-markdown'
  "Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()
" }}}

" ------------- ⚙️  SETTINGS ------------- {{{
syntax on
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
"set t_Co=256 "For lightline plugin force 256 terminal colors
highlight Comment cterm=italic gui=italic

" Enable 24bit true color for night owl colorscheme
if (has("termguicolors"))
 set termguicolors
endif

set number relativenumber
set tabstop=2 shiftwidth=2 expandtab
set splitbelow splitright "Natural split appearance
set ignorecase "Need for smartcase
set smartcase "Ignore case when all letters lower
set cursorline
set scrolloff=5 "Padding if press z-enter
set hidden "Allow change edited buffer
set signcolumn=yes:1
set mouse=a "enable all mouse actions
" Set completeopt to have a better completion experience for completion-nvim
set completeopt=menuone,noinsert,noselect

"-- FOLDING --  
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldnestmax=3
set foldlevel=1
"set nofoldenable
"set foldcolumn=1 "defines 1 col at window left, to indicate folding  
"let javaScript_fold=1 "activate folding by JS syntax  
set foldlevelstart=99 "start file with all folds opened

" }}}

" ------------- 🗺️  MAPPING ------------- {{{
"MAPPING
let mapleader=","
inoremap df <ESC>
map <leader>w :w!<CR>
map <leader>pi :PlugInstall<CR>
nmap <leader>ec :tabedit ~/.config/nvim/init.vim<CR>

"Active 'very magic' mode search for Reg exp
nnoremap / /\v

"Hide search hightlights
nmap <silent> <BS> :nohlsearch<CR>

"Nvim Tree
"nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-n> :NvimTreeFindFileToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

"hop
"onoremap <leader>s :HopChar1<CR>
map <leader>s :HopChar1<CR>

" Tabbar
nmap <F8> :TagbarToggle<CR>

" Simplify the navigation when search help
nmap <silent> <RIGHT>         :cnext<CR>
nmap <silent> <RIGHT><RIGHT>  :cnfile<CR><C-G>
nmap <silent> <LEFT>          :cprev<CR>
nmap <silent> <LEFT><LEFT>    :cpfile<CR><C-G>

" }}}

" ------------- 🎛️  AUTOCOMMANS ------------- {{{
augroup autosourcing
  autocmd!
  autocmd BufWritePost init.vim source %
augroup END

"highlight yanked text
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup END

"Neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

"Terminal
augroup neovim_terminal
  autocmd!
  "Enter Terminal-mode (insert) automatically
  autocmd TermOpen * startinsert
  "Disables number lines on terminal buffers
  autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
augroup END

" }}}

" Remapping <C-y>, just doesn't cut it.
function! s:expand_html_tab()
  "try to determine if we're within quotes or tags.
  "if so, assume we're in an emmet fill area.
  let line = getline('.')
    if col('.') < len(line)
      let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
      if len(line) >= 2
        return "\<C-n>"
      endif
    endif
  "expand anything emmet thinks is expandable.
  if emmet#isExpandable()
    return emmet#expandAbbrIntelligent("\<tab>")
    " return "\<C-y>,"
  endif
  "return a regular tab character
  return "\<tab>"
endfunction
" let g:user_emmet_expandabbr_key='<Tab>'
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

autocmd FileType html,pug,css,scss,typescriptreact,vue,markdown.mdx imap <silent><buffer><expr><tab> <sid>expand_html_tab()
  let g:user_emmet_mode='a'
  let g:user_emmet_complete_tag = 0
  let g:user_emmet_install_global = 0
autocmd FileType html,pug,css,scss,typescriptreact,vue,markdown.mdx EmmetInstall

" Expand
"imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
"smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

"imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
"let g:copilot_no_tab_map = v:true

lua << EOF

vim.notify = require("notify")

EOF

lua require('physicist')
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''

let @q = "Iconsole.log(\<Esc>A)\<Esc>"

"Go to index of notes and set working directory to my notes
nnoremap <leader>kb :e $KNOWLEDGE_BASE_DIR/index.md<CR>:cd $KNOWLEDGE_BASE_DIR<CR>
