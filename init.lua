require("user.options")
require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.autocmds")

vim.cmd.colorscheme("tokyonight-storm")

require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
})
