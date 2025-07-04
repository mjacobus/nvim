-- 1. Setup for all requested language servers:
--    - Ruby (ruby_lsp)
--    - TypeScript/JavaScript (ts_ls)
--    - HTML (html)
--    - CSS (cssls)
--    - Dart (dartls)
--
-- 2. Standard LSP keybindings:
--    - gD: Go to declaration
--    - gd: Go to definition
--    - K: Hover documentation
--    - gi: Go to implementation
--    - <C-k>: Signature help
--    - <leader>wa: Add workspace folder
--    - <leader>wr: Remove workspace folder
--    - <leader>wl: List workspace folders
--    - <leader>D: Type definition
--    - <leader>rn: Rename
--    - <leader>ca: Code actions
--    - gr: Find references
--    - <leader>f: Format code

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require('lspconfig')

      -- Global LSP settings
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- LSP keymaps
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end

      -- Custom Diagnostics Keymaps
      vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic' })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Set Loclist Diagnostics' })

      -- Ruby LSP
      lspconfig.ruby_lsp.setup({
        cmd = { vim.fn.expand("~/.asdf/shims/ruby"), "-S", "ruby-lsp" },
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- TypeScript/JavaScript LSP
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- HTML LSP
      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- CSS LSP
      lspconfig.cssls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Dart LSP (Flutter)
      lspconfig.dartls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end,
  }
}
