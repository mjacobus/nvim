return {
  "folke/zen-mode.nvim",
  config = function()
    local map = vim.keymap.set

    local cmd = function()
      local zen = require("zen-mode")
      zen.setup({
        window = {
          width = 140,
          options = {},
        },
      })
      zen.toggle()
    end

    map("n", "<leader>zz", cmd, { desc = "Toggle Zen Mode" })
  end,
}
