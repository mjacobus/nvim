-- lua/plugins/telescope.lua

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
      -- @see https://github.com/nvim-telescope/telescope.nvim/tree/master?tab=readme-ov-file#sorters
      sorter = sorters.get_fzy_sorter(),
      previewer = previewers.vim_buffer_cat.new({}),
    })
    :find()
end

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-fzy-native.nvim",
    },
    config = function()
      local telescope = require("telescope")
      telescope.load_extension("fzy_native")
    end,
    cmd = "Telescope",
    keys = {
      -- Files
      { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find files with Telescope git_files" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
      { "<Space><Space>", function()
        local project_root = require("project_nvim.project").get_project_root() or vim.fn.getcwd()
        require("telescope.builtin").find_files({
          cwd = project_root, -- Force project root
        })
      end, desc = "Find Files (Project Root)" },

      -- Search
      -- { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
      { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Word" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },

      -- Git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
      { "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "branches" },
      { "<leader>h", searchBranchFiles, desc = "Branch Files" },

      -- LSP
      { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
      { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
      { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
      { "<leader>li", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations" },
      { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
      { "<leader>lt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Type Definitions" },

      -- Commands
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },

      -- Custom
      { "<Space>sg", function()
        require("mj.telescope.grep_with_args").setup()
      end, desc = "Custom Live Grep With args" },
    },
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        -- sorter = require("telescope.sorters").get_fzy_sorter(), -- TODO: Check if this will be needed
        mappings = {
          i = {
            ["<C-j>"] = function(...)
              require("telescope.actions").move_selection_next(...)
            end,
            ["<C-k>"] = function(...)
              require("telescope.actions").move_selection_previous(...)
            end,
            ["<C-n>"] = function(...)
              require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-p>"] = function(...)
              require("telescope.actions").cycle_history_prev(...)
            end,
          },
        },
      },
    },
  },
}
