-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- use numbers for the lines and not relative numbers
vim.o.number = true
vim.o.relativenumber = false

-- UFO Folding Options
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:>,foldsep: ,foldclose:v]]


-- Turn off GitBlame by default
-- vim.g.gitblame_enabled = 0
