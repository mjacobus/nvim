return {
  "tpope/vim-fugitive",
  lazy = false,  -- Load the plugin at startup
  keys = {
    -- Define your custom mappings
    { "<leader>gS", "<cmd>Git<cr>", desc = "Git status" },
    { "<leader>gw", "<cmd>Git add %<cr>", desc = "Git add {file}" },
    { "<leader>gbl", "<cmd>Git blame<cr>", desc = "Git blame (vim fugitive)" },
  },
}
