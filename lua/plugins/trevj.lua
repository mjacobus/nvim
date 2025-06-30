return {
  "AckslD/nvim-trevJ.lua",
  config = function()
    local map = vim.keymap.set

    map("n", "<leader>rw", function()
      require("trevj").format_at_cursor()
    end, { desc = "Rewrap arguments (one comma per line)" })
  end,
}
