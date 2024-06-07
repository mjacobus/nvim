-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- init.lua
local lspconfig = require("lspconfig")

-- Setup Ruby Language Server
lspconfig.ruby_ls.setup({
  cmd = { "ruby-lsp" },
  filetypes = { "ruby" },
  settings = {
    ruby = {
      diagnostics = true,
      completion = true,
    },
  },
})

-- Setup Solargraph
lspconfig.solargraph.setup({
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  settings = {
    solargraph = {
      diagnostics = true,
    },
  },
})

vim.defer_fn(function()
  vim.cmd([[highlight Comment cterm=italic gui=italic guibg=#4c4e69 guifg=#1a1b26]])
end, 100)
