-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { 'mhinz/vim-startify',    name = 'Startify' },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    name = 'TokyoNight colorscheme',
    config = function()
      vim.cmd.colorscheme('tokyonight-night')
      --vim.cmd[[colorscheme tokyonight-night]]
    end,
  },
  { 'catppuccin/nvim',       name = 'Catppuccin colorscheme' },
  { 'rose-pine/neovim',      name = 'Rose-pine colorscheme' },
  { 'rebelot/kanagawa.nvim', name = 'Kanagawa colorscheme' },
  { 'oxfist/night-owl.nvim', name = 'Night Owl' },

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    name = 'Neotree',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  },
  {
    'akinsho/bufferline.nvim',
    name = 'Bufferline',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'nvim-lualine/lualine.nvim',
    name = 'lualine',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {
    name = 'Telescope',
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  { 'nvim-treesitter/nvim-treesitter',             name = 'Treesitter',            build = ':TSUpdate' },
  { 'nvim-treesitter/nvim-treesitter-textobjects', name = 'Treesitter textobjects' },

  {
    'windwp/nvim-autopairs',
    name = 'autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end,
  },

  { 'lewis6991/gitsigns.nvim',           name = 'Git signs' },

  -- Configurations for LSP
  {
    'williamboman/mason.nvim',
    name = 'Mason',
    build = ':MasonUpdate', -- :MasonUpdate updates registry contents
  },
  { 'williamboman/mason-lspconfig.nvim', name = 'Mason lspconfig' },
  'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
  'hrsh7th/nvim-cmp',      -- Autocompletion plugin
  'hrsh7th/cmp-nvim-lsp',  -- LSP source for nvim-cmp
  'hrsh7th/cmp-buffer',
  --  'hrsh7th/cmp-path',
  --  'hrsh7th/cmp-cmdline',
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*',
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',
  },
  'saadparwaiz1/cmp_luasnip',

  { 'onsails/lspkind.nvim', name = 'lspkind' },
  --  {
  --    "glepnir/lspsaga.nvim",
  --    name = 'lspsaga',
  --    event = "LspAttach",
  --    config = function()
  --      require("lspsaga").setup({
  --        lightbulb = {
  --          virtual_text = false
  --        }
  --      })
  --    end,
  --    dependencies = {
  --      {"nvim-tree/nvim-web-devicons"},
  --      --Please make sure you install markdown and markdown_inline parser
  --      {'nvim-treesitter/nvim-treesitter', name = 'Treesitter'}
  --    }
  --  },
  --  {'ray-x/lsp_signature.nvim' },
  'nvimtools/none-ls.nvim',
  --
  --  -- Other
  --  'tpope/vim-surround',
  'christoomey/vim-tmux-navigator',
  {
    'numToStr/Comment.nvim',
    name = 'Comment',
    config = function()
      require('Comment').setup()
    end,
  },
  --  {
  --    'numToStr/Comment.nvim',
  --    name = 'Comment',
  --    config = function()
  --        require('Comment').setup()
  --    end
  --  },
  --  {
  --  {'folke/neodev.nvim', config = function() require('neodev').setup({}) end},
  {
    'folke/neodev.nvim',
    config = function()
      require('neodev').setup({})
    end,
  },
  { 'folke/zen-mode.nvim',  name = 'Zen Mode' },
  {
    'folke/which-key.nvim',
    name = 'Which-key',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
  --  {
  --    'folke/todo-comments.nvim',
  --    name = 'Todo-comments',
  --    dependencies = 'nvim-lua/plenary.nvim',
  --    config = function()
  --      require('todo-comments').setup {
  --        -- your configuration comes here
  --        -- or leave it empty to use the default settings
  --        -- refer to the configuration section below
  --      }
  --    end
  --  },
  --  'rcarriga/nvim-notify',
  { 'asiryk/auto-hlsearch.nvim',           name = 'hlsearch', tag = '1.1.0' },
  --  -- 'windwp/nvim-ts-autotag'
  --  -- 'NvChad/nvim-colorizer.lua'
  'MunifTanjim/prettier.nvim',
  --  {
  --    'akinsho/toggleterm.nvim',
  --    name = 'ToggleTerm',
  --    version = '*',
  --    config = function()
  --      require("toggleterm").setup()
  --    end
  --  },
  --  {
  --    'folke/noice.nvim',
  --    name = 'Noice',
  --    config = function()
  --      require('noice').setup({
  --        presets = {
  --          command_palette = true, -- position the cmdline and popupmenu together
  --          bottom_search = true, -- use a classic bottom cmdline for search
  --        },
  --        lsp = {
  --          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --          -- override = {
  --          --   ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --          --   ["vim.lsp.util.stylize_markdown"] = true,
  --          --   ["cmp.entry.get_documentation"] = true,
  --          -- },
  --          -- blocks lspsaga keymapping
  --          progress = {
  --            enabled = false,
  --          }
  --        }
  --      })
  --    end,
  --    dependencies = {
  --      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --      'MunifTanjim/nui.nvim',
  --      -- OPTIONAL:
  --      --   `nvim-notify` is only needed, if you want to use the notification view.
  --      --   If not available, we use `mini` as the fallback
  --      'rcarriga/nvim-notify',
  --    }
  --  },
  { 'wakatime/vim-wakatime',               name = 'Wakatime', lazy = false },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl',      opts = {} },
  {
    'folke/trouble.nvim',
    name = 'Trouble',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      --mode = 'quickfix'
    },
  },
}

require('lazy').setup(plugins, {
  ui = {
    border = 'rounded',
  },
})
