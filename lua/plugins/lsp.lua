local function setup_keymaps(bufnr)
  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: " .. desc, silent = true })
  end

  -- Navigation
  map("n", "gd", vim.lsp.buf.definition, "Go to definition")
  map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
  map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
  map("n", "gr", vim.lsp.buf.references, "Go to references")
  map("n", "gt", vim.lsp.buf.type_definition, "Go to type definition")

  -- Information
  map("n", "K", vim.lsp.buf.hover, "Hover documentation")
  map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
  map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")

  -- Code actions
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
  map("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")

  -- Diagnostics
  map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
  map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
  map("n", "<leader>cd", vim.diagnostic.open_float, "Show diagnostic")
  map("n", "<leader>cl", vim.diagnostic.setloclist, "Diagnostics to loclist")

  -- Workspace
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "List workspace folders")
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then return end

    -- Setup keymaps for this buffer
    setup_keymaps(bufnr)

    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Enable inlay hints if supported (Neovim 0.10+)
    if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    -- Document highlight on cursor hold
    if client.server_capabilities.documentHighlightProvider then
      local highlight_group = vim.api.nvim_create_augroup("LspDocumentHighlight_" .. bufnr, { clear = true })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = bufnr,
        group = highlight_group,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = bufnr,
        group = highlight_group,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

local function config(_, opts)
  local caps = require("blink.cmp").get_lsp_capabilities()

  -- define configs
  for server, server_opts in pairs(opts.servers) do
    local cfg = vim.tbl_deep_extend("force", {
      capabilities = caps,
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
    dependencies = {
      "saghen/blink.cmp",
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
          "neovim/nvim-lspconfig",
          { "williamboman/mason.nvim", build = ":MasonUpdate", config = true },
        },
        config = function()
          require("mason-lspconfig").setup {
            ensure_installed = {
              "copilot",
              "ruby_lsp",
              "ts_ls",
              "html",
              "cssls",
              "lua_ls",
            },
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
