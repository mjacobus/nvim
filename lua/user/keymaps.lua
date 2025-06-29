vim.g.mapleader = " "
local keymap = vim.keymap.set

keymap("n", "<leader>pv", vim.cmd.Ex)
keymap("n", "<C-s>", ":w<CR>", { desc = "Save file" })
keymap("i", "jk", "<Esc>")
