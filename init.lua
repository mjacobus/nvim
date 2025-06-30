require("user.options")
require("user.keymaps")
require("user.plugins")

vim.cmd.colorscheme("tokyonight-storm")

require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
})
