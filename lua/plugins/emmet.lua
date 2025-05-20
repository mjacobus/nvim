return {
  "mattn/emmet-vim",
  init = function()
    vim.g.user_emmet_settings = {
      eruby = {
        extends = "html",
      },
    }
  end,
}
