return {
  "smoka7/hop.nvim",
  version = "*",
  opts = {},
  config = function()
    local hop = require("hop")
    hop.setup()
    vim.api.nvim_set_hl(0, "HopNextKey", { fg = "#ffcc00", bold = true })
    vim.api.nvim_set_hl(0, "HopNextKey1", { fg = "#ff8800", bold = true })
    vim.api.nvim_set_hl(0, "HopNextKey2", { fg = "#ff4400" })

    -- Define key mappings similar to EasyMotion
    vim.keymap.set("n", "<leader><leader>f", function()
      require("hop").hint_char1({
        direction = require("hop.hint").HintDirection.AFTER_CURSOR,
        current_line_only = false,
      })
    end, { desc = "Jump to character (EasyMotion-like)" })
  end,
}
