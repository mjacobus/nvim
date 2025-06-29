return {
  "rking/ag.vim",
  config = function()
    local map = vim.keymap.set

    map("n", "<leader>ag", ":Ag!<space>", { desc = "Ag! file" })
    map("n", "<leader>g#", ":Ag! -w <C-R><C-W><space>", { desc = "Ag! word under cursor" })
    map("n", "<leader>gh#", ":Ag! --hidden -w <C-R><C-W><space>", { desc = "Ag! word under cursor, including hidden" })
    map("n", "<leader>ahg", ":Ag! --hidden<space>", { desc = "Ag! hidden files" })
    map("n", "<leader>ayg", "y:Ag! '<C-R>\"'", { desc = "Ag! yanked text" })
    map("n", "<leader>ga", ":AgAdd!<space>", { desc = "AgAdd!" })
  end,
}
