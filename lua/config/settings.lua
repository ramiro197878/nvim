vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = " "
vim.o.termguicolors = true
vim.o.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.colorcolumn = '81'
vim.o.wrap = true
vim.opt.list = true
vim.opt.listchars = { tab = '| ', trail = '·' }
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\n\+\%$//e]],
})
