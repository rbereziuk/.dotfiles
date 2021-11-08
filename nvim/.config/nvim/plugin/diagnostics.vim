lua << EOF

-- DIAGNOSTICS
local util = require "lspconfig".util

require'lspconfig'.diagnosticls.setup{
  filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
  root_dir = function(fname)
    return util.root_pattern("tsconfig.json")(fname) or
    util.root_pattern(".eslintrc.json")(fname);
  end,
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable virtual_text
        virtual_text = false
      }
    ),
  },
  init_options = {
    linters = {
      eslint = {
        command = "./node_modules/.bin/eslint",
        --rootPatterns = {".eslintrc.json", ".git"},

        --command = "eslint",
        rootPatterns = {".git"},
        debounce = 100,
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json"
        },
        sourceName = "eslint",
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "[eslint] ${message} [${ruleId}]",
          security = "severity"
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      },
    },
    filetypes = {
      javascript = "eslint",
      javascriptreact = "eslint",
      typescript = "eslint",
      typescriptreact = "eslint"
    },
    formatters = {
      eslint = {
        command = './node_modules/.bin/eslint',
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { '.git' },
      },
      eslint_d = {
        command = 'eslint_d',
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { '.git' },
      },
      prettier = {
        command = './node_modules/.bin/prettier',
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        --args = { '--stdin-filepath', '%filename' }
      }
    },
    formatFiletypes = {
      javascript = 'eslint_d',
      javascriptreact = 'prettier',
      typescript = 'prettier',
      typescriptreact = 'prettier'
    }
  }
}

EOF
