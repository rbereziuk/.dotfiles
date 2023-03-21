local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'
  use 'mhinz/vim-startify'

  use 'folke/tokyonight.nvim'
  use 'rose-pine/neovim'
  use 'rebelot/kanagawa.nvim'

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons'
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'nvim-treesitter/nvim-treesitter'

  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- LSP
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use({'L3MON4D3/LuaSnip', tag = 'v1.*'})
  use 'saadparwaiz1/cmp_luasnip'
  use 'onsails/lspkind.nvim'
  use({
    'glepnir/lspsaga.nvim',
    branch = 'main'
  })

  use {
    'windwp/nvim-autopairs',
      config = function() require('nvim-autopairs').setup {} end
  }
  use 'windwp/nvim-ts-autotag'


  use 'NvChad/nvim-colorizer.lua'

  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  use {
    'lewis6991/gitsigns.nvim',
  }

  use 'tpope/vim-surround'

  use 'christoomey/vim-tmux-navigator'

  use({ "asiryk/auto-hlsearch.nvim", tag = "1.0.0" })

  use 'ray-x/lsp_signature.nvim'

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  use {
    'folke/zen-mode.nvim',
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = require('packer.util').float,
    working_sym = ' ',
    error_sym = ' ',
    done_sym = ' ',
    removed_sym = ' ',
    moved_sym = ' ',
  }
}
})
