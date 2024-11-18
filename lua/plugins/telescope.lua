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
    end,
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("live_grep_args")

      vim.keymap.set("n", "<leader>sg", function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end, { desc = "Live Grep with Args" })
    end,
  },
}

-- opts = function(_, opts)
--     vim.keymap.set("n", "<Space><Space>", function()
--       local project_root = require("project_nvim.project").get_project_root() or vim.fn.getcwd()
--       require("telescope.builtin").find_files({
--         cwd = project_root, -- Force project root
--       })
--     end, { desc = "Find Files (Project Root)" })
--   end,
