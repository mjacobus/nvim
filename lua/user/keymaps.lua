vim.g.mapleader = " "
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("i", "jj", "<Esc>")


map("i", "jj", "<Esc>", { desc = "Go to normal mode" })
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save file" })

-- Placeholder: Replace with actual function if needed
-- map("v", "<leader>", function() alternative_file.open("next", "--exists") end)

-- Buffer management
map("n", "<leader>Q", "<cmd>q!<cr>", opts)
map("n", "<leader>q", "<cmd>bdelete<cr>", opts)
map("n", "<leader>bdd", "<cmd>bdelete!<cr>", opts)
map("n", "<leader>bda", "<cmd>bufdo %bd!<cr>", opts)

-- Notes
map("n", "<leader>et", ":e ~/.tmp/notes/", opts)
map("n", "<leader>on", ":e ~/.tmp/notes/notes.md<cr>", opts)
map("n", "<leader>con", ":e ~/.tmp/notes/notes.md<cr>", opts)

-- Terminal escape
map("t", "<esc>", "<C-\\><C-n>", opts)
map("t", "jj", "<C-\\><C-n>", opts)

-- Search
map("n", "<leader>f", "<cmd>/", opts)
map("n", "<leader>F", "<cmd>nohlsearch<cr>", opts)

-- Quickfix
map("n", "<leader>gn", ":cnext<CR>", opts)
map("n", "<leader>gp", ":cprev<CR>", opts)

-- Buffer navigation
map("n", "<leader>bn", ":bn<cr>", opts)
map("n", "<leader>bp", ":bp<cr>", opts)
map("n", "<leader><leader>b", ":b<space>", opts)

-- Select all
map("n", "<leader>a", "ggVG", opts)

-- Tabs
map("n", "<C-w>t", ":tabnew<cr>", opts)

-- Insert helpers
map("i", ",e", "<Esc>/[\\]})\"']<cr><Esc>:nohlsearch<cr>a", opts)
map("i", "<C-l>", "<Space>=><Space>", opts)

-- Hashrocket
map("v", "<leader>h", [[:s/\:\([a-zA-Z_]\+\)\s\+=>/\=printf("%s:", submatch(1))/g<CR><ESC>:let @/ = ""<CR>]], opts)

-- Quit
map("n", "<Leader>qq", "<ESC>:q<cr>", opts)

-- Reload
map("n", "<Leader>rel", ":e<CR>", opts)

-- File finder (stub)
map("n", "<leader>*", ":find<space>", opts)

-- Formatting
map("v", "Q", "gq", opts)
map("n", "Q", "gqap", opts)

-- Resizing
map("n", "<Up>", "<C-w>+", opts)
map("n", "<Down>", "<C-w>-", opts)
map("n", "<Left>", "<C-w><", opts)
map("n", "<Right>", "<C-w>>", opts)

-- Make file executable
map("n", "<leader><leader>xx", "<esc>:!chmod +x %<cr>", opts)

-- Marks
map("n", "<leader>mA", "ma", opts)
map("n", "<leader>ma", "'a", opts)
map("n", "<leader>m1", "'a", opts)
map("n", "<leader>mB", "mb", opts)
map("n", "<leader>mb", "'b", opts)
map("n", "<leader>m2", "'b", opts)
map("n", "<leader>mC", "mc", opts)
map("n", "<leader>mc", "'c", opts)
map("n", "<leader>m3", "'c", opts)
map("n", "<leader>mD", "md", opts)
map("n", "<leader>md", "'d", opts)
map("n", "<leader>m4", "'d", opts)
map("n", "<leader>mE", "me", opts)
map("n", "<leader>me", "'e", opts)
map("n", "<leader>m5", "'e", opts)

-- Open notes
map("n", "<leader>no", ":vs ~/.tmp/notes.md<cr>", opts)

-- Open shell_test
map("n", "<leader><leader>1", ":e shell_test<cr>", opts)
