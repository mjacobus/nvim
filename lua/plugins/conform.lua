vim.api.nvim_create_autocmd("FileType", {
  pattern = "sql",
  callback = function()
    local root = vim.fs.dirname(vim.fs.find({ ".git", "pyproject.toml" }, {
      upward = true,
      path = vim.api.nvim_buf_get_name(0),
    })[1])

    if root and not vim.loop.fs_stat(root .. "/.sqlfluff") then
      vim.fn.writefile({
        "[sqlfluff]",
        "dialect = postgres",
      }, root .. "/.sqlfluff")
      print("Created .sqlfluff in " .. root)
    end
  end,
})
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        sql = { "sqlfluff" },
        -- …other filetypes…
      },
      formatters = {
        sqlfluff = {
          args = { "format", "--dialect", "postgres", "-" },
          stdin = true,
        },
      },

      -- **DISABLE** format‑on‑save globally
      format_on_save = nil,
    })

    -- -----------------------------------------------------------------
    -- <leader>fs  →  format on demand
    -- -----------------------------------------------------------------
    vim.keymap.set({ "n", "v" }, "<leader>fs", function()
      conform.format({
        async = false,          -- synchronous (blocks until done)
        timeout_ms = 1000,      -- give the formatter 1 s
        lsp_fallback = true,    -- fall back to LSP if sqlfluff fails
      })
    end, { desc = "Format buffer (or selection) with Conform" })
  end,
}
