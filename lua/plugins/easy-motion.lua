return {
  "smoka7/hop.nvim",
  version = "*",
  opts = {},
  keys = {
    -- Define key mappings similar to EasyMotion
    {
      "<leader><leader>f",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          current_line_only = false,
        })
      end,
      mode = { "n", "x", "o" },
      desc = "Jump to character (EasyMotion-like)",
    },
    -- Define key mappings similar to EasyMotion
    {
      "<leader><leader>F",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
          current_line_only = false,
        })
      end,
      mode = { "n", "x", "o" },
      desc = "Jump to character (EasyMotion-like)",
    },
  },
}
