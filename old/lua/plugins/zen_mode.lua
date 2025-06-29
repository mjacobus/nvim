return {
  "folke/zen-mode.nvim",
  config = function()
    local map = LazyVim.safe_keymap_set

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
