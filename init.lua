require("user.options")
require("user.keymaps")
require("user.plugins")

vim.cmd.colorscheme("catppuccin-mocha")

require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
})
