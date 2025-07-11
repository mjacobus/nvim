local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local function is_installed(command)
  return vim.fn.executable(command) == 1
end

local plugins = {

  -- add LazyVim and import its plugins
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },

  -- import any extras modules here
  -- { import = "lazyvim.plugins.extras.lang.typescript" },
  -- { import = "lazyvim.plugins.extras.lang.json" },
  -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
  { import = "lazyvim.plugins.extras.coding.luasnip" },
  { import = "lazyvim.plugins.extras.coding.neogen" }, -- generate annotations

  { import = "lazyvim.plugins.extras.ai.copilot" },
  { import = "lazyvim.plugins.extras.coding.nvim-cmp" },

  { import = "lazyvim.plugins.extras.ui.treesitter-context" },

  { import = "lazyvim.plugins.extras.editor.telescope" },
  -- { import = "lazyvim.plugins.extras.editor.harpoon2" },
  { import = "lazyvim.plugins.extras.editor.refactoring" },
  { import = "lazyvim.plugins.extras.editor.aerial" }, -- <leader>ss list constants
  { import = "lazyvim.plugins.extras.editor.dial" }, -- like speadating

  { import = "lazyvim.plugins.extras.lang.ruby" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.toml" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  -- { import = "lazyvim.plugins.extras.lang.sql" }, -- missing, appartently
  { import = "lazyvim.plugins.extras.lang.markdown" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.git" },

  { import = "lazyvim.plugins.extras.lsp.neoconf" },
  { import = "lazyvim.plugins.extras.lsp.none-ls" },

  { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
  { import = "lazyvim.plugins.extras.util.octo" },
}

-- Conditionally add PHP plugin if PHP is installed
if is_installed("php") then
  table.insert(plugins, { import = "lazyvim.plugins.extras.lang.php" })
end

-- import/override with your plugins
table.insert(plugins, { import = "plugins" })

require("lazy").setup({
  spec = plugins,
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = false, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
})
