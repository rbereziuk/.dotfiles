require("mason").setup({
  ui = {
    border = 'rounded'
  }
})

require('mason-lspconfig').setup {
  ensure_installed = { 'ts_ls', 'emmet_ls', 'tailwindcss', 'marksman', 'pyright' },
}
