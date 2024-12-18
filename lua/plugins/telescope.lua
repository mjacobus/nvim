-- lua/plugins/telescope.lua
-- https://www.lazyvim.org/extras/editor/telescope
return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      vim.keymap.set("n", "<Space><Space>", function()
        local project_root = require("project_nvim.project").get_project_root() or vim.fn.getcwd()
        require("telescope.builtin").find_files({
          cwd = project_root, -- Force project root
        })
      end, { desc = "Find Files (Project Root)" })

      vim.keymap.set("n", "<Space>sg", function()
        require("mj.telescope.grep_with_args").setup()
      end, { desc = "Custom Live Grep With args" })
    end,
  },
}
