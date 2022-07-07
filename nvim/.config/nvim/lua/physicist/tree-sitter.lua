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
    "html",
    "css",
    "scss",
    "javascript",
    "jsdoc",
    "typescript",
    "tsx",
    "markdown",
    "json",
    "yaml"
  },
}
