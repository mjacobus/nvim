-- TODO: There are mappings that I did not port yet
-- For instance: https://github.com/mjacobus/lvim/tree/main/after/ftplugin
-- https://github.com/mjacobus/lvim/tree/main/after/plugin
-- https://github.com/mjacobus/lvim/tree/main/autoload
-- https://github.com/mjacobus/lvim/blob/main/after/plugin/legacy_setup.vim#L179-L212
-- Maybe some here: https://github.com/mjacobus/lvim/blob/main/lua/config/mappings.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })

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


-- Alternate file
map("n", "<leader>af", "<c-^>", { desc = "Alternate file" })

-- Avoid arrow keys in command mode
map("c", "<C-h>", "<left>", { desc = "Move left" })
map("c", "<C-j>", "<down>", { desc = "Move down" })
map("c", "<C-k>", "<up>", { desc = "Move up" })
map("c", "<C-l>", "<right>", { desc = "Move right" })
map("c", "<C-x>", "<del>", { desc = "Delete" })


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
map("n", "*", "*N", { desc = "Search and stay" })

-- Quickfix
map("n", "<leader>gn", ":cnext<CR>", { desc = "Next quickfix occurrency" })
map("n", "<leader>gp", ":cprev<CR>", { desc = "Previous quickfix occurrency" })


-- Buffer navigation
map("n", "<leader>bn", ":bn<cr>", opts)
map("n", "<leader>bp", ":bp<cr>", opts)
map("n", "<leader><leader>b", ":b<space>", opts)

map("n", "<leader>a", "ggVG", { desc = "Select all" })

-- Tabs
map("n", "<c-w>t", ":tabnew<cr>", { desc = "New tab" })

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

map("n", "<leader>rm", ":Delete<cr>", { desc = "Delete file" })
map("n", "<leader>o", "<c-^>", { desc = "Last buffer" })

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


map("n", "<Leader><leader>at", function()
  require("mj.test_runner").run_all_tests()
end, { desc = "Run all tests" })

map("n", "<Leader><leader>t", function()
  require("mj.test_runner").test_line()
end, { desc = "Run test for current line" })

map("n", "<Leader>t", function()
  require("mj.test_runner").test_line()
end, { desc = "Run test for current line" })

map("n", "<Leader>T", function()
  require("mj.test_runner").run_test_file()
end, { desc = "Run test file" })

map("n", "<leader><leader>st", function()
  require("mj.test_runner").run_shell_test()
end, { desc = "Run ./shell_test" })


map("v", "<leader>", function()
  alternative_file.open("next", "--exists")
end, { desc = "Open next alternative file" })

local alternative_file = require("mj.alternate_file")

map("n", "<leader>irc", function()
  require("mj.ruby_utils").insert_ruby_class_based_on_file_path()
end, { desc = "Insert ruby class" })

-- Fix a quirk with isfname including ":"
-- This vim.opt.isfname:remove(":") may be overwritten on new buffers
map("n", "gf", function()
  local raw = vim.fn.expand("<cfile>")
  local file, lnum, col = raw:match("^(.*):(%d+):?(%d*)$")
  if file then
    vim.cmd.edit(vim.fn.fnameescape(file))
    if lnum then vim.api.nvim_win_set_cursor(0, { tonumber(lnum), math.max(tonumber(col) - 1, 0) }) end
  else
    vim.cmd.edit(vim.fn.fnameescape(raw))
  end
end, { desc = "goto file (supports file:line[:col])" })

-- this is not working correctly
-- map("v", "<leader>irc", function()
--   require("mj.ruby_utils").replace_selected_text_with_ruby_class()
-- end, { desc = "Replace selected text ruby class" })

map("n", "<leader>aj", function()
  alternative_file.open("prev", "--exists")
end, { desc = "Open previous alternative file" })


map("n", "<leader>j", function()
  require("mj.utils").close_terminal_buffer(true)
end, { desc = "Close terminal buffer (true)" })

map("n", "<leader>k", function()
  require("mj.utils").close_terminal_buffer(false)
end, { desc = "Close terminal buffer (false)" })


-- Alternative file navigation
map("n", "<leader>ak", function()
  alternative_file.open("next", "--exists")
end, { desc = "Next alternative file" })
map("n", "<leader>aj", function()
  alternative_file.open("prev", "--exists")
end, { desc = "Previous alternative file" })


map("t", "<esc>", "<C-\\><C-n>", { desc = "Escape terminal mode" })
map("t", "jj", "<C-\\><C-n>", { desc = "Escape terminal mode with jj" })


-- From old, might be dup
-- -- Jumps to the next position after the closest closing char
-- map("i", ",e", "<Esc>/[\\]})\"']<cr><Esc>:nohlsearch<cr>a", { desc = "Jump to next closing char" })
--
-- -- Adds arrow
-- map("i", "<C-l>", "<Space>=><Space>", { desc = "Insert arrow" })
--
-- -- Rails specific
-- map(
--   "v",
--   "<leader>h",
--   ':s/\\:\\([a-zA-Z_]\\+\\)\\s\\+=>/\\=printf("%s:", submatch(1))/g<CR><ESC>:let @/ = ""<CR>',
--   { desc = "Convert hash rocket to symbol" }
-- )
-- map("n", "<Leader>qq", "<ESC>:q<cr>", { desc = "Quit" })
--
-- -- Reload buffer
-- map("n", "<Leader>rel", ":e<CR>", { desc = "Reload buffer" })
--
-- -- Find
-- map("n", "<leader>f", "<ESC>/", { desc = "Find" })
-- map("n", "<leader>*", "<ESC>:find<space>", { desc = "Find file" })
--
-- -- Use Q for formatting the current paragraph (or selection)
-- map("v", "Q", "gq", { desc = "Format selection" })
-- map("n", "Q", "gqap", { desc = "Format paragraph" })
--
-- -- Buffer resizing mappings (shift + arrow key)
-- map("n", "<Up>", "<c-w>+", { desc = "Resize buffer up" })
-- map("n", "<Down>", "<c-w>-", { desc = "Resize buffer down" })
-- map("n", "<Left>", "<c-w><", { desc = "Resize buffer left" })
-- map("n", "<Right>", "<c-w>>", { desc = "Resize buffer right" })
--
-- map("n", "<leader><leader>xx", "<esc>:!chmod +x %<cr>", { desc = "Make file executable" })
--
-- map("n", "<leader><leader>b", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search in current buffer" })
--
-- -- Marks
-- map("n", "<leader>mA", "ma", { desc = "Set mark 'a'" })
-- map("n", "<leader>ma", "'a", { desc = "Go to mark 'a'" })
-- map("n", "<leader>m1", "'a", { desc = "Go to mark 'a'" })
--
-- map("n", "<leader>mB", "mb", { desc = "Set mark 'b'" })
-- map("n", "<leader>mb", "'b", { desc = "Go to mark 'b'" })
-- map("n", "<leader>m2", "'b", { desc = "Go to mark 'b'" })
--
-- map("n", "<leader>mC", "mc", { desc = "Set mark 'c'" })
-- map("n", "<leader>mc", "'c", { desc = "Go to mark 'c'" })
-- map("n", "<leader>m3", "'c", { desc = "Go to mark 'c'" })
--
-- map("n", "<leader>mD", "md", { desc = "Set mark 'd'" })
-- map("n", "<leader>md", "'d", { desc = "Go to mark 'd'" })
-- map("n", "<leader>m4", "'d", { desc = "Go to mark 'd'" })
--
-- map("n", "<leader>mE", "me", { desc = "Set mark 'e'" })
-- map("n", "<leader>me", "'e", { desc = "Go to mark 'e'" })
-- map("n", "<leader>m5", "'e", { desc = "Go to mark 'e'" })
--
-- -- Notes
-- map("n", "<leader>no", ":vs ~/.tmp/notes.md<cr>", { desc = "Open notes" })
