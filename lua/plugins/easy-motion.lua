return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      char = { enabled = false }, -- Disable `f` and `t` enhancements
    },
  },
  keys = {
    -- <leader>f{char} to move to {char}
    {
      "<leader><leader>f",
      function()
        require("flash").jump({ search = { mode = "search" } })
      end,
      mode = { "n", "x", "o" },
      desc = "Jump to character (EasyMotion)",
    },

    -- s{char}{char} to move to {char}{char}
    {
      "<leader>sf",
      function()
        require("flash").jump({ pattern = ".", search = { mode = "search", multi_window = true } })
      end,
      mode = { "n", "x", "o" },
      desc = "Jump to character pair",
    },

    -- Move to line
    {
      "<leader>L",
      function()
        require("flash").jump({ search = { mode = "lines", multi_window = true } })
      end,
      mode = { "n", "x", "o" },
      desc = "Jump to line",
    },

    -- Move to word
    {
      "<leader>w",
      function()
        require("flash").jump({ search = { mode = "words", multi_window = true } })
      end,
      mode = { "n", "x", "o" },
      desc = "Jump to word",
    },
  },
}
