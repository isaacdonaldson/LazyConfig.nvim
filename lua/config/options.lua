-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- use numbers for the lines and not relative numbers
vim.o.number = true
vim.o.relativenumber = false

vim.o.foldcolumn = "1" -- "0" remove the fold column
vim.o.foldlevelstart = 99
vim.o.foldlevel = 99
vim.o.foldenable = true
vim.o.foldmethod = "expr"
vim.wo.foldtext = ""
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.fillchars = [[eob: ,fold: ,foldopen:v,foldsep: ,foldclose:>]]

vim.g.lazyvim_statuscolumn = {
  folds_open = true
}

vim.opt.scrolloff = 10

-- Turn off GitBlame by default
-- vim.g.gitblame_enabled = 0
