vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Natural split appearance
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true -- need for smartcase
vim.opt.smartcase = true -- ignore case when all letters lower
vim.opt.scrolloff = 5 -- padding if press z-enter
vim.opt.hidden = true -- allow change edited buffer
vim.opt.mouse = 'a' -- enable all mouse actions
vim.opt.signcolumn = 'yes:1'

vim.cmd[[colorscheme tokyonight-night]]
