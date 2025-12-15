return {
  {
    "Saghen/blink.cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "zbirenbaum/copilot.lua",
    },
    opts = {
      keymap = {
        preset = "default",

        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "fallback" },
        ["<C-l>"] = { "accept", "fallback" },
      },

      completion = {
        menu = { border = "rounded" },
      },

      sources = {
        default = {
          "copilot",
          "lsp",
          "snippets",
          "buffer",
          "path",
        },
      },
    },
  },
}
