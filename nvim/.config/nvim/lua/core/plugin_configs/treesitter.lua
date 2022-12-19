require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "html", "css", "javascript", "typescript", "tsx", "lua", "go" },

  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true,
  }
}
