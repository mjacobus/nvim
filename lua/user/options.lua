vim.g.mapleader = " "

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.relativenumber = false
vim.opt.colorcolumn = "100"
vim.opt.swapfile = false
vim.g.swap = false

-- undo
--
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
-- vim.fn.mkdir(vim.opt.undodir:get(), "p")

-- suggested by chatgpt
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 300
vim.opt.scrolloff = 8
vim.opt.splitright = true
vim.opt.wrap = false


-- Enable smart case search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.isfname:remove(":")

-- Diagnostic config
-- TODO: Do I still need this?
-- vim.diagnostic.config({ virtual_text = false })
