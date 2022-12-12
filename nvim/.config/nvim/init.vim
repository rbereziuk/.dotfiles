"- vim:fdm=marker
" ------------- 📦 PLUGINS DEFINITION ------------- {{{
call plug#begin(stdpath('data') . '/plugged')

  " --- Browse ---
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-media-files.nvim'
  "Plug 'glepnir/dashboard-nvim'

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
  "Plug 'airblade/vim-gitgutter'
  Plug 'lewis6991/gitsigns.nvim'
  
  " --- LSP ---
  Plug 'neovim/nvim-lspconfig' "Collection of configurations for built-in LSP client
  Plug 'hrsh7th/nvim-cmp' "Autocompletion plugin
  Plug 'hrsh7th/cmp-nvim-lsp' "LSP source for nvim-cmp
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-nvim-lua'
  Plug 'onsails/lspkind-nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
  Plug 'nvim-treesitter/playground'
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  "Plug 'nvim-treesitter/nvim-treesitter-context'

  " Snippets
  Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.1.0'}
  Plug 'saadparwaiz1/cmp_luasnip'

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
  Plug 'Shatur/neovim-ayu'
  Plug 'sainnhe/sonokai'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'rebelot/kanagawa.nvim'
  Plug 'bluz71/vim-nightfly-guicolors'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'bluz71/vim-nightfly-guicolors'
  Plug 'catppuccin/nvim', {'as': 'catppuccin'}
  Plug 'sam4llis/nvim-tundra'


  " --- Icons ---
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'

  " --- Other ---
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  Plug 'norcalli/nvim-colorizer.lua'
  
  " --- Track statictics ---
  "Plug 'ActivityWatch/aw-watcher-vim'

  " --- TESTING ---
  "Plug 'github/copilot.vim'  
  "Plug 'nvim-orgmode/orgmode'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'toppair/reach.nvim'
  Plug '/home/roman/Lab/stackmap.nvim/'
  Plug '/home/roman/Lab/nvim-plugins/dailynotes.nvim/'
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

  Plug 'godlygeek/tabular'
  Plug 'preservim/vim-markdown'
  Plug 'folke/zen-mode.nvim'
  "Plug 'vim-pandoc/vim-pandoc'
  "Plug 'vim-pandoc/vim-pandoc-syntax'
  "Plug 'khzaw/vim-conceal'
  "Plug 'renerocksai/telekasten.nvim'
  Plug 'dhruvasagar/vim-table-mode'
  Plug 'jose-elias-alvarez/null-ls.nvim'
call plug#end()
" }}}

" ------------- ⚙️  SETTINGS ------------- {{{
syntax on
set background=dark
let g:gruvbox_contrast_dark = 'hard'
"colorscheme ayu-mirage
colorscheme tokyonight-night
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

"Go to index of notes and set working directory to my notes
nnoremap <leader>kb :e $KNOWLEDGE_BASE_DIR/index.md<CR>:cd $KNOWLEDGE_BASE_DIR<CR>
nnoremap <leader>dn <cmd>lua require'dailynotes'.open_window()<cr>

nnoremap <leader>rl :sourse %<cr>

" }}}

" ------------- 🎛️  AUTOCOMMANS ------------- {{{
augroup autosourcing
  autocmd!
  autocmd BufWritePost init.vim source %
augroup END

augroup noting
  autocmd!
  autocmd FileType markdown set linebreak
augroup END

"augroup atom_words
"  autocmd!
"  autocmd FileType css set iskeyword+=-,__
"augroup END

"highlight yanked text
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup END

"Terminal
augroup neovim_terminal
  autocmd!
  "Enter Terminal-mode (insert) automatically
  autocmd TermOpen * startinsert
  "Disables number lines on terminal buffers
  autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
augroup END

augroup wikilinks
  autocmd!
  au BufRead,BufNewFile */Knowledge-base/** set suffixesadd=.md
augroup END

augroup react_learning
  autocmd!
  autocmd BufRead,BufNewFile ~/Lab/fem/epic-react/react-hooks/src/exercise/** setlocal filetype=javascriptreact
  autocmd BufRead,BufNewFile ~/Lab/fem/epic-react/advanced-react-hooks/src/exercise/** setlocal filetype=javascriptreact
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

"let g:user_emmet_expandabbr_key='<Tab>'
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

autocmd FileType html,pug,css,scss,javascriptreact,typescriptreact,vue,markdown.mdx imap <silent><buffer><expr><tab> <sid>expand_html_tab()
  let g:user_emmet_mode='a'
  let g:user_emmet_complete_tag = 0
  let g:user_emmet_install_global = 0
autocmd FileType html,pug,css,scss,javascriptreact,typescriptreact,vue,markdown.mdx EmmetInstall

"imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
"let g:copilot_no_tab_map = v:true

lua require('physicist')
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''

let @q = "Iconsole.log(\<Esc>A)\<Esc>"

"highlight Normal guibg=none
"highlight NonText guibg=none

let g:mkdp_theme = 'light'

lua << EOF

--require("null-ls").setup({
--  sources = {
--    require("null-ls").builtins.formatting.prettier,
--    --require("null-ls").builtins.formatting.stylua,
--    require("null-ls").builtins.diagnostics.eslint,
--    require("null-ls").builtins.completion.spell,
--  },
--  -- you can reuse a shared lspconfig on_attach callback here
--  on_attach = function(client, bufnr)
--      if client.supports_method("textDocument/formatting") then
--          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--          vim.api.nvim_create_autocmd("BufWritePre", {
--              group = augroup,
--              buffer = bufnr,
--              callback = function()
--                  -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--                  vim.lsp.buf.formatting_sync()
--              end,
--          })
--      end
--  end,
--})

EOF

