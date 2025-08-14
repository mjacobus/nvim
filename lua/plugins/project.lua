-- lua/plugins/project.lua
return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern" },
        patterns = {
          ".git",
          "Gemfile",
          -- "package.json",
        }, -- Adjust as needed
        sync_root_with_cwd = true, -- Sync `cwd` with project root
      })

      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          local project_root = require("project_nvim.project").get_project_root()
          if project_root and vim.fn.getcwd() ~= project_root then
            print("Changing Project Root:", project_root)
            vim.cmd("cd " .. project_root)
          end
        end,
      })
    end,
  },
}
