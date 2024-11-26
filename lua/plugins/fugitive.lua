return {
  "tpope/vim-fugitive",
  keys = {
    -- Unmap the default mapping for <leader>gS (if it exists)
    { "<leader>gS", false },

    -- Define your custom mappings
    { "<leader>gS", "<cmd>Git<cr>", desc = "Git status" },
    { "<leader>gw", "<cmd>Git add %<cr>", desc = "Git add {file}" },
    { "<leader>gbl", "<cmd>Git blame<cr>", desc = "Git blame (vim fugitive)" },
  },
}
