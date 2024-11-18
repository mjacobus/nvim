-- lua/plugins/telescope.lua
-- https://www.lazyvim.org/extras/editor/telescope
return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    opts.keys = opts.keys or {}
    opts.keys["<Space><Space>"] = function()
      require("telescope.builtin").find_files({
        cwd = require("project_nvim.project").get_project_root() or vim.fn.getcwd(),
      })
    end
  end,
}
