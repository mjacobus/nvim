return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      char = { enabled = false }, -- Disable `f` and `t` enhancements
    },
  },
  config = function()
    vim.api.nvim_set_hl(0, "FlashMatch", { fg = "NONE", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "FlashCurrent", { fg = "#ffffff", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#ffcc00", bg = "NONE", bold = true })
  end,
  keys = {
    {
      "<leader><leader>f",
      function()
        require("flash").jump({
          search = {
            forward = true,
            wrap = true,
            multi_window = false,
          },
        })
      end,
      mode = { "n", "x", "o" },
      desc = "Jump to character (EasyMotion)",
    },
  },
}
