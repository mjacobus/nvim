vim.g.swap = false

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.relativenumber = false
vim.opt.colorcolumn = "100"
vim.opt.swapfile = false

-- suggested by chatgpt
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 300
vim.opt.scrolloff = 8


-- Diagnostic config
-- TODO: Do I still need this?
-- vim.diagnostic.config({ virtual_text = false })
