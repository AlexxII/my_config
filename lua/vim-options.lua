vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nu rnu")
vim.g.mapleader = " "

vim.opt.colorcolumn = "120"
vim.opt.updatetime = 100
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"

-- буфер обмена
vim.opt.clipboard = "unnamedplus"

vim.keymap.set('i', 'jk', '<esc>', {})

-- показ окна диагностики
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold, CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

