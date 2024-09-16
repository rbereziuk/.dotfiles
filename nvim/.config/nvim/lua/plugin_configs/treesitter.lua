require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    'c',
    'lua',
    'vim',
    'vimdoc',
    'query',
    'html',
    'pug',
    'css',
    'javascript',
    'typescript',
    'tsx',
    'python',
    'go',
    'rust',
    'markdown',
    'markdown_inline',
    'yaml',
    'bash',
    'regex',
    'graphql'
  },

  highlight = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<Leader>ss", -- set to `false` to disable one of the mappings
      node_incremental = "<Leader>si",
      scope_incremental = "<Leader>sc",
      node_decremental = "<Leader>sd",
    },
  },
  indent = {
    enable = true
  },

  -- From https://github.com/windwp/nvim-ts-autotag/tree/nvim_0.9
  autotag = {
    enable = true,
  },

  -- nvim-treesitter-textobjects
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
      }
    }
  }
}

--vim.opt.foldmethod = 'expr'
--vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
--vim.opt.foldenable = false
