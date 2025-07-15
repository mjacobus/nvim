-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.swap = false

local opt = vim.opt

opt.relativenumber = false
opt.colorcolumn = "100"
opt.swapfile = false


opt.undofile = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"

-- Optional: make sure the directory exists
vim.fn.mkdir(opt.undodir:get(), "p")
