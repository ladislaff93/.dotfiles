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
vim.cmd("set clipboard=unnamedplus")

vim.cmd("imap kj <Esc>")
vim.cmd("vmap kj <Esc>")

vim.o.guifont = "JetBrainsMono Nerd Font Mono"

vim.cmd("nnoremap <CR> :noh<CR><CR>")

-- decrease width
vim.cmd("nnoremap <C-H> <C-W><")
-- increase width
vim.cmd("nnoremap <C-L> <C-W>>")
-- decrease height
vim.cmd("nnoremap <C-K> <C-W>-")
-- increase height
vim.cmd("nnoremap <C-J> <C-W>+")
-- move window in normal
vim.cmd("nnoremap <A-h> <C-w>h")
vim.cmd("nnoremap <A-j> <C-w>j")
vim.cmd("nnoremap <A-k> <C-w>k")
vim.cmd("nnoremap <A-l> <C-w>l")
-- create windows using H, J, K, L
vim.cmd("nnoremap <A-H> <C-w>v")
vim.cmd("nnoremap <A-J> <C-w>s<C-w>k")
vim.cmd("nnoremap <A-K> <C-w>s")
vim.cmd("nnoremap <A-L> <C-w>v<C-w>h")
