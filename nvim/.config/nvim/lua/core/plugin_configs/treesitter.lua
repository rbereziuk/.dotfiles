require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "html", "css", "javascript", "typescript", "tsx", "lua", "go", "markdown", "markdown_inline", "yaml" },

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