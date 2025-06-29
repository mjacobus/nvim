return {
  "tyru/open-browser-github.vim",
  dependencies = { { "tyru/open-browser.vim" } },
  config = function()
    local map = LazyVim.safe_keymap_set

    map("n", "<leader>of", function()
      vim.cmd("OpenGithubFile")
    end, { desc = "Open Github file" })

    map("v", "<leader>of", function()
      vim.api.nvim_command("'<,'>OpenGithubFile")
    end, { desc = "Open Github file (visual)" })
  end,
}
