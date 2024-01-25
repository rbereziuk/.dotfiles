require("mason").setup({
  ui = {
    border = 'rounded'
  }
})

require('mason-lspconfig').setup {
  ensure_installed = { 'tsserver', 'emmet_ls', 'tailwindcss', 'marksman', 'pyright' },
}
