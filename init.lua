require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.autocmds")
require("mj.globals")

vim.cmd.colorscheme("tokyonight-storm")

require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
})
