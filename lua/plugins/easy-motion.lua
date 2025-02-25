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
    {
      "f",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          current_line_only = true,
        })
      end,
      mode = { "n", "x", "o" },
      desc = "Hop forward to char",
    },

    -- EasyMotion-style `F` search (backward, current line only)
    {
      "F",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
          current_line_only = true,
        })
      end,
      mode = { "n", "x", "o" },
      desc = "Hop backward to char",
    },

    -- `t` behaves like `f` but stops before the target character (forward)
    {
      "t",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          current_line_only = true,
          hint_offset = -1,
        })
      end,
      mode = { "n", "x", "o" },
      desc = "Hop forward before char",
    },

    -- `T` behaves like `F` but stops before the target character (backward)
    {
      "T",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
          current_line_only = true,
          hint_offset = 1,
        })
      end,
      mode = { "n", "x", "o" },
      desc = "Hop backward before char",
    },
  },
}
