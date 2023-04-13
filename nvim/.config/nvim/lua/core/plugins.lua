-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'mhinz/vim-startify',
  'folke/tokyonight.nvim',
  'rose-pine/neovim',
  'rebelot/kanagawa.nvim',

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  {
    'akinsho/bufferline.nvim', 
    version = "v3.*", 
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  'nvim-treesitter/nvim-treesitter-textobjects',

  'lewis6991/gitsigns.nvim',
  {
    'windwp/nvim-autopairs',
      config = function() require('nvim-autopairs').setup {} end
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
  },
  "williamboman/mason-lspconfig.nvim",

  -- Configurations for LSP
  'neovim/nvim-lspconfig', 
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "1.*",
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  'saadparwaiz1/cmp_luasnip',
  'onsails/lspkind.nvim',
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({})
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  },
  'ray-x/lsp_signature.nvim',
  'jose-elias-alvarez/null-ls.nvim',

  -- Other
  'tpope/vim-surround',
  'christoomey/vim-tmux-navigator',
  {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  },
  {
    'folke/zen-mode.nvim',
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  { "asiryk/auto-hlsearch.nvim", tag = "1.0.0" },
  -- 'windwp/nvim-ts-autotag'
  -- 'NvChad/nvim-colorizer.lua'
  -- 'MunifTanjim/prettier.nvim'
  -- {
  --   'akinsho/toggleterm.nvim', 
  --   tag = '*', 
  --   config = function()
  --     require("toggleterm").setup()
  --   end
  -- }
})