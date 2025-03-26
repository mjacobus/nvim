-- lua/plugins/telescope.lua
-- https://www.lazyvim.org/extras/editor/telescope
local function searchBranchFiles()
  local results = require("mj.utils").branch_files()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local sorters = require("telescope.sorters")
  local previewers = require("telescope.previewers")

  pickers
    .new({}, {
      prompt_title = "Branch Files",
      finder = finders.new_table({
        results = results,
      }),
      sorter = sorters.get_generic_fuzzy_sorter(),
      previewer = previewers.vim_buffer_cat.new({}),
    })
    :find()
end
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

      vim.keymap.set("n", "<leader>h", searchBranchFiles, { desc = "Telescope find branch files" })
    end,
  },
}
