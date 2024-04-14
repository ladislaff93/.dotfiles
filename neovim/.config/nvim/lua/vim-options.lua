-- set leader key
vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set smartindent")
vim.cmd("set scrolloff=8")

vim.cmd("imap kj <Esc>")
vim.cmd("vmap kj <Esc>")
vim.cmd("nnoremap <leader>n :Vex<CR>")
