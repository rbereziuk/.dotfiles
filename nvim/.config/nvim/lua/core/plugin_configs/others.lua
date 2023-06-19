require("auto-hlsearch").setup()
--require "lsp_signature".setup()

require("indent_blankline").setup {
  filetype_exclude = { 'startify' },
  show_current_context = true,
  show_current_context_start = false,
   show_trailing_blankline_indent = false,

  context_patterns = {
    "class", "return", "function", "method", "^if", "^while", "jsx_element", "^for", "^object",
    "^table", "block", "arguments", "if_statement", "else_clause", "jsx_element",
    "jsx_self_closing_element", "try_statement", "catch_clause", "import_statement",
    "operation_type"
  }
}
--vim.cmd [[highlight IndentBlanklineChar guifg=#27283F gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineChar guifg=#1D1E2F gui=nocombine]]
