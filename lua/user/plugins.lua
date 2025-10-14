local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- require("lazy").setup({
--   { "nvim-lua/plenary.nvim" },
--   { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
--   { "nvim-telescope/telescope.nvim", tag = "0.1.5" },
--   { "catppuccin/nvim", name = "catppuccin" },
--   { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}, }
-- })

require('lazy').setup('plugins', {
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
}) -- lua/plugins/*
