return {
  { "zaldih/themery.nvim", lazy = false, config = function()
    -- combinando themes starry + base16
    local themes = vim.fn.getcompletion("", "color")
    require("themery").setup({ themes = themes, livePreview = true })
    vim.keymap.set("n", "<leader>tp", "<cmd>Themery<cr>", { desc = "Theme picker" })
  end
  },
}
