return {
  {
    "zbirenbaum/copilot.lua",  -- Or use the official "github/copilot.vim" if preferred
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },  -- Disable inline ghost text
      panel = { enabled = false },      -- Disable panel
    },
  },
  {
    "fang2hou/blink-copilot",
  },
  {
    "Saghen/blink.cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "fang2hou/blink-copilot",  -- Add as dependency
    },
    opts = {
      -- Your existing opts...
      sources = {
        default = {
          "lsp",
          "snippets",
          "buffer",
          "path",
          "copilot",  -- Add copilot to the list
        },
        providers = {
          copilot = {
            name = "Copilot",          -- Display name in menu
            module = "blink-copilot",  -- The module providing the source
            async = true,
            score_offset = 5,          -- Higher = better priority (adjust as needed)
            opts = {                   -- Optional blink-copilot specific options
              max_completions = 3,
              debounce = 750,
              auto_refresh = { backward = true, forward = true },
            },
          },
        },
      },
    },
  },

}
