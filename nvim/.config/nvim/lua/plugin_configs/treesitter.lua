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

  -- Install if open file with no parser
  --auto_install = true,

  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
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

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false
