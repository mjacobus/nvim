return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = opts.servers or {}

    -- Ruby LSP
    opts.servers.ruby_lsp = vim.tbl_deep_extend("force", opts.servers.ruby_lsp or {}, {
      cmd = { vim.fn.expand("~/.asdf/shims/ruby"), "-S", "ruby-lsp" },
    })

    -- Dart LSP (Flutter)
    opts.servers.dartls = {}
  end,
}
