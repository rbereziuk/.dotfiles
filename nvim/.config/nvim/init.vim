" vim:fdm=marker
" ------------- 📦 PLUGINS DEFINITION ------------- {{{
call plug#begin(stdpath('data') . '/plugged')
  "Experimental
  Plug 'digitaltoad/vim-pug'
  Plug 'mhinz/vim-startify'

  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'phaazon/hop.nvim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  "Plug 'junegunn/goyo.vim'
  "Plug 'junegunn/limelight.vim'
  Plug 'mattn/emmet-vim'

  Plug 'airblade/vim-gitgutter'

  " LSP
  Plug 'neovim/nvim-lspconfig' "Collection of configurations for built-in LSP client
  Plug 'hrsh7th/nvim-cmp' "Autocompletion plugin
  Plug 'hrsh7th/cmp-nvim-lsp' "LSP source for nvim-cmp
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'onsails/lspkind-nvim'
  Plug 'windwp/nvim-autopairs'

  " For vsnip users.
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'


  "Plug 'glepnir/lspsaga.nvim'
  Plug 'rinx/lspsaga.nvim'
  "Plug 'nvim-lua/"completion-nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

  Plug 'sbdchd/neoformat'
  Plug 'ActivityWatch/aw-watcher-vim'

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  Plug 'gruvbox-community/gruvbox'
  Plug 'haishanh/night-owl.vim'
  Plug 'Shatur/neovim-ayu'

  Plug 'hoob3rt/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ryanoasis/vim-devicons'
  
call plug#end()
" }}}

" ------------- ⚙️  SETTINGS ------------- {{{
syntax on
"colorscheme gruvbox
colorscheme ayu
set background=dark

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

"Hide search hightlights
nmap <silent> <BS> :nohlsearch<CR>

"Nvim Tree
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

"hop
nnoremap <leader>s :HopChar1<CR>

nnoremap <leader>dw :Goyo 60%<CR>

" }}}

" ------------- 🔌 PLUGINS SETTINGS ------------- {{{

" --- Goyo --- {
function! s:goyo_enter()
  set number relativenumber
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
" }

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

" ------------- 🌑 LUA ------------- {{{

lua << EOF

require('lualine').setup{
  options = { 
    section_separators = '',
    component_separators = ''
  }
}
require'hop'.setup()
require'nvim-tree'.setup({
  update_cwd = true
})

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "json",
    "yaml",
    "html",
    "scss"
  },
}

EOF

"---------------"
" Remapping <C-y>, just doesn't cut it.
  function! s:expand_html_tab()
" try to determine if we're within quotes or tags.
" if so, assume we're in an emmet fill area.
   let line = getline('.')
   if col('.') < len(line)
     let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
     if len(line) >= 2
        return "\<C-n>"
     endif
   endif
" expand anything emmet thinks is expandable.
  if emmet#isExpandable()
    return emmet#expandAbbrIntelligent("\<tab>")
    " return "\<C-y>,"
  endif
" return a regular tab character
  return "\<tab>"
  endfunction
  " let g:user_emmet_expandabbr_key='<Tab>'
  " imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

  autocmd FileType html,pug,css,scss,typescriptreact,vue,javascript,markdown.mdx imap <silent><buffer><expr><tab> <sid>expand_html_tab()
  let g:user_emmet_mode='a'
  let g:user_emmet_complete_tag = 0
  let g:user_emmet_install_global = 0
  autocmd FileType html,pug,css,scss,typescriptreact,vue,javascript,markdown.mdx EmmetInstall
"}}}
"
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'


let g:startify_change_to_vcs_root = 1
    let g:startify_change_cmd = 'cd'

