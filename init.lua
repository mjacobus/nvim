-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- init.lua
local lspconfig = require("lspconfig")

if lspconfig and lspconfig.ruby_ls and lspconfig.ruby_ls.setup then
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
end

if lspconfig and lspconfig.solargraph and lspconfig.solargraph.setup then
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
end

-- vim.defer_fn(function()
--   vim.cmd([[highlight Comment guifg=#222436 guibg=#5c5e77 gui=italic]])
-- end, 100)
