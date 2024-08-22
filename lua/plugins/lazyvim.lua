return {
  "LazyVim/LazyVim",
  opts = {
    -- colorscheme = "tokyonight-moon",
    colorscheme = "tokyonight-storm",
    config = function()
      vim.defer_fn(function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "#394264" }) -- Change background color
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#394264" }) -- Change background for floating windows
        vim.cmd([[highlight Comment guifg=#222436 guibg=#5c5e77 gui=italic]])
      end, 1000)
    end,
  },
}
