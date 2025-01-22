return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    print("heeeey")
    opts.servers = opts.servers or {}
    opts.servers.ruby_lsp = vim.tbl_deep_extend("force", opts.servers.ruby_lsp or {}, {
      cmd = { vim.fn.expand("~/.asdf/shims/ruby"), "-S", "ruby-lsp" },
    })
  end,
}
