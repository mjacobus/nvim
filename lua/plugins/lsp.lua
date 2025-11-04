local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)
end

local function config(_, opts)
  local caps = require("blink.cmp").get_lsp_capabilities()

  -- define configs
  for server, server_opts in pairs(opts.servers) do
    local cfg = vim.tbl_deep_extend("force", {
      capabilities = caps,
      on_attach = on_attach,
    }, server_opts or {})

    -- either of these works; I’ll use the callable form:
    vim.lsp.config(server, cfg)
    -- (equivalent alternative)
    -- vim.lsp.config[server] = cfg
  end

  -- enable all at once for current & future buffers of those filetypes
  vim.lsp.enable(vim.tbl_keys(opts.servers))
end

return {
  {
    "neovim/nvim-lspconfig",
    enabled = false,
    dependencies = {
      "saghen/blink.cmp",
      { "williamboman/mason.nvim", build = ":MasonUpdate", config = true },
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
          require("mason-lspconfig").setup {
            ensure_installed = { "ruby_lsp", "ts_ls", "html", "cssls", "lua_ls" },
            automatic_installation = true,
          }
        end,
      },
    },
    opts = {
      servers = {
        ruby_lsp = {},
        ts_ls   = {},
        html    = {},
        cssls   = {},
        lua_ls  = {},
      },
    },
    config = config,
  },
}
