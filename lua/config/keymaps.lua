-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- TODO: There are mappings that I did not port yet
-- For instance: https://github.com/mjacobus/lvim/tree/main/after/ftplugin
-- https://github.com/mjacobus/lvim/tree/main/after/plugin
-- https://github.com/mjacobus/lvim/tree/main/autoload
-- https://github.com/mjacobus/lvim/blob/main/after/plugin/legacy_setup.vim#L179-L212
-- Maybe some here: https://github.com/mjacobus/lvim/blob/main/lua/config/mappings.lua
-- And here

vim.keymap.del("n", "<leader>ff") -- conflicts with <leader>f<f>word

local map = LazyVim.safe_keymap_set

-- better up/down
map("i", "jj", "<Esc>", { desc = "Go to normal mode" })
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save file" })

local alternative_file = require("mj.alternate_file")

map("n", "<leader>ak", function()
  alternative_file.open("next", "--exists")
end, { desc = "Open next alternative file" })

map("n", "<leader>aj", function()
  alternative_file.open("prev", "--exists")
end, { desc = "Open previous alternative file" })

-- Key mappings
map("n", "<leader>Q", "<cmd>q!<cr>", { desc = "Quit" })
map("n", "<leader>q", "<cmd>bdelete<cr>", { desc = "Close buffer" })
map("n", "<leader>bdd", "<cmd>bdelete!<cr>", { desc = "Close buffer!" })
map("n", "<leader>bda", "<cmd>bufdo %bd!<cr>", { desc = "Close all buffers!" })

-- Notes
map("n", "<leader>et", ":e ~/.tmp/notes/", { desc = "Edit notes" })
map("n", "<leader>on", ":e ~/.tmp/notes/notes.md<cr>", { desc = "Open notes" })
map("n", "<leader>con", ":e ~/.tmp/notes/notes.md<cr>", { desc = "Open notes" })

map("n", "<leader>j", function()
  require("mj.utils").close_terminal_buffer(true)
end, { desc = "Close terminal buffer (true)" })

map("n", "<leader>k", function()
  require("mj.utils").close_terminal_buffer(false)
end, { desc = "Close terminal buffer (false)" })

-- Search mappings
map("n", "<leader>f", "<cmd>/", { desc = "Search alias" })
map("n", "<leader>F", "<cmd>nohlsearch<cr>", { desc = "Remove search highlight" })

-- Alternative file
map("n", "<leader>af", "<c-^>", { desc = "Alternative file" })

-- Avoid arrow keys in command mode
map("c", "<C-h>", "<left>", { desc = "Move left" })
map("c", "<C-j>", "<down>", { desc = "Move down" })
map("c", "<C-k>", "<up>", { desc = "Move up" })
map("c", "<C-l>", "<right>", { desc = "Move right" })
map("c", "<C-x>", "<del>", { desc = "Delete" })

-- Alternative file navigation
map("n", "<leader>ak", function()
  alternative_file.open("next", "--exists")
end, { desc = "Next alternative file" })
map("n", "<leader>aj", function()
  alternative_file.open("prev", "--exists")
end, { desc = "Previous alternative file" })

-- Diagnostic config
vim.diagnostic.config({ virtual_text = false })

-- Running tests
map("n", "<Leader><leader>at", function()
  require("mj.test_runner").run_all_tests()
end, { desc = "Run all tests" })

map("n", "<Leader><leader>t", function()
  require("mj.test_runner").test_line()
end, { desc = "Run test for current line" })

map("n", "<Leader>T", function()
  require("mj.test_runner").run_test_file()
end, { desc = "Run test file" })

map("n", "<leader><leader>st", function()
  require("mj.test_runner").run_shell_test()
end, { desc = "Run ./shell_test" })

-- quick fix
map("n", "<leader>gn", ":cnext<CR>", { desc = "Next quickfix occurrency" })
map("n", "<leader>gp", ":cprev<CR>", { desc = "Previous quickfix occurrency" })

-- rm file
map("n", "<leader>rm", ":Delete<cr>", { desc = "Delete file" })

-- Last buffer
map("n", "<leader>o", "<c-^>", { desc = "Last buffer" })

-- Escape terminal mode with jj
map("t", "<esc>", "<C-\\><C-n>", { desc = "Escape terminal mode" })
map("t", "jj", "<C-\\><C-n>", { desc = "Escape terminal mode with jj" })

-- Buffer changing
map("n", "<leader>bn", ":bn<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bp<cr>", { desc = "Previous buffer" })

-- Find buffer file
map("n", "<leader><leader>b", ":b<space>", { desc = "Find buffer file" })

-- Search
map("n", "*", "*N", { desc = "Search and stay" })

-- Select all
map("n", "<leader>a", "ggVG", { desc = "Select all" })

-- New tab
map("n", "<c-w>t", ":tabnew<cr>", { desc = "New tab" })

-- Jumps to the next position after the closest closing char
map("i", ",e", "<Esc>/[\\]})\"']<cr><Esc>:nohlsearch<cr>a", { desc = "Jump to next closing char" })

-- Adds arrow
map("i", "<C-l>", "<Space>=><Space>", { desc = "Insert arrow" })

-- Rails specific
map(
  "v",
  "<leader>h",
  ':s/\\:\\([a-zA-Z_]\\+\\)\\s\\+=>/\\=printf("%s:", submatch(1))/g<CR><ESC>:let @/ = ""<CR>',
  { desc = "Convert hash rocket to symbol" }
)
map("n", "<Leader>qq", "<ESC>:q<cr>", { desc = "Quit" })

-- Reload buffer
map("n", "<Leader>rel", ":e<CR>", { desc = "Reload buffer" })

-- Find
map("n", "<leader>f", "<ESC>/", { desc = "Find" })
map("n", "<leader>*", "<ESC>:find<space>", { desc = "Find file" })

-- Use Q for formatting the current paragraph (or selection)
map("v", "Q", "gq", { desc = "Format selection" })
map("n", "Q", "gqap", { desc = "Format paragraph" })

-- Buffer resizing mappings (shift + arrow key)
map("n", "<Up>", "<c-w>+", { desc = "Resize buffer up" })
map("n", "<Down>", "<c-w>-", { desc = "Resize buffer down" })
map("n", "<Left>", "<c-w><", { desc = "Resize buffer left" })
map("n", "<Right>", "<c-w>>", { desc = "Resize buffer right" })

map("n", "<leader><leader>xx", "<esc>:!chmod +x %<cr>", { desc = "Make file executable" })
