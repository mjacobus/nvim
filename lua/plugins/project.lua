-- lua/plugins/project.lua
return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern" },
        patterns = { ".git", "Gemfile", "package.json" }, -- Adjust for your project
        sync_root_with_cwd = true, -- Ensure working directory syncs with root
      })
      require("telescope").load_extension("projects")
    end,
  },
}
