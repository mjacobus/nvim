-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- init.lua
local lspconfig = require("lspconfig")

if lspconfig and lspconfig.ruby_lsp and lspconfig.ruby_lsp.setup then
  -- Setup Ruby Language Server
  lspconfig.ruby_lsp.setup({
    cmd = { "ruby-lsp" },
    filetypes = { "ruby" },
    settings = {
      ruby = {
        diagnostics = true,
        completion = true,
      },
    },
  })
end

if lspconfig and lspconfig.solargraph and lspconfig.solargraph.setup then
  -- Setup Solargraph
  lspconfig.solargraph.setup({
    cmd = { "solargraph", "stdio" },
    filetypes = { "ruby" },
    settings = {
      solargraph = {
        diagnostics = true,
      },
    },
  })
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd("%s/\\s\\+$//e")
  end,
})

vim.defer_fn(function()
  local light_bg = "#394264"
  local slightly_darker_bg = "#384160"
  local dark_bg = "#222437"

  -- vim.api.nvim_set_hl(0, "Normal", { bg = light_bg })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = light_bg })
  -- vim.api.nvim_set_hl(0, "NormalNC", { bg = light_bg })
  -- -- vim.cmd([[highlight Comment guifg=#222436 guibg=#5c5e77 gui=italic]])
  --
  -- -- Set a vertical line at column 100
  -- vim.opt.colorcolumn = "100"
  -- vim.api.nvim_set_hl(0, "ColorColumn", { bg = slightly_darker_bg }) -- Use the desired color
  --
  -- vim.api.nvim_set_hl(0, "LineNr", { fg = dark_bg })
  --
  -- vim.opt.cursorline = true
  -- vim.api.nvim_set_hl(0, "CursorLine", { bg = slightly_darker_bg })
  --
  -- -- Set the background color for DiagnosticSignError
  -- vim.api.nvim_set_hl(0, "DiagnosticSignError", { bg = light_bg, fg = "#ff0000" }) -- Set your desired colors
  --
  -- -- Set the background color for DiagnosticSignWarn
  -- vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { bg = light_bg, fg = "#ffaa00" }) -- Set your desired colors
  --
  -- -- Set the background color for DiagnosticSignInfo
  -- vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { bg = light_bg, fg = "#00aaff" }) -- Set your desired colors
  --
  -- -- Set the background color for DiagnosticSignHint
  -- vim.api.nvim_set_hl(0, "DiagnosticSignHint", { bg = light_bg, fg = "#00ff00" }) -- Set your desired colors

  -- Define the new background color
  -- local new_bg = light_bg

  -- Update the highlight groups that match the original background
  -- local highlights = {
  --   -- General UI elements
  --   "Normal",
  --   "NormalNC",
  --   "CursorLine",
  --   "CursorLineNr",
  --   "ColorColumn",
  --   "SignColumn",
  --   "StatusLine",
  --   "StatusLineNC",
  --   "TabLine",
  --   "TabLineFill",
  --   "TabLineSel",
  --   "VertSplit",
  --   "WinSeparator",
  --
  --   -- Editor elements
  --   "LineNr",
  --   "Folded",
  --   "NonText",
  --   "SpecialKey",
  --   "EndOfBuffer",
  --   "IncSearch",
  --   "Search",
  --   "Visual",
  --   "VisualNOS",
  --
  --   -- Diagnostics
  --   "DiagnosticSignError",
  --   "DiagnosticSignWarn",
  --   "DiagnosticSignInfo",
  --   "DiagnosticSignHint",
  --
  --   -- Gutter elements (like Git signs)
  --   "GitSignsAdd",
  --   "GitSignsChange",
  --   "GitSignsDelete",
  -- }
  --
  -- for _, group in ipairs(highlights) do
  --   vim.api.nvim_set_hl(0, group, { bg = new_bg })
  -- end
end, 100)
