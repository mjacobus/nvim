-- after/ftplugin/ruby.lua
local lspconfig = require("lspconfig")
lspconfig.ruby_lsp.setup({
  cmd = { vim.fn.expand("~/.asdf/shims/ruby"), "-S", "ruby-lsp" },
})

local map = LazyVim.safe_keymap_set

-- map("n", "<leader>x", ":lua RunInTerminal('ruby ' .. vim.fn.expand('%'), true)<CR>", { buffer = true })

map("n", "<leader>x", function()
  RunInTerminal("ruby " .. vim.fn.expand("%"), true)
end, { desc = "Execute ruby file", buffer = true })

-- vim.cmd([[
--   autocmd FileType ruby nnoremap <buffer> <leader>cs :lua RunRubocop()<CR>
-- ]])
--
-- vim.cmd([[
--   autocmd FileType ruby nnoremap <buffer> <leader>x :lua RunInTerminal("ruby " .. vim.fn.expand('%'), true)<CR>
-- ]])

-- Maybe this
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "ruby",
--   callback = function()
--     map("n", "<leader>x", ":lua RunInTerminal('ruby ' .. vim.fn.expand('%'), true)<CR>", { buffer = true })
--   end,
-- })
