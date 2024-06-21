return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- Set custom formatting to add padding
      opts.formatting = {
        format = function(entry, vim_item)
          -- vim_item.abbr = " " .. vim_item.abbr .. " " -- Add padding
          return vim_item
        end,
      }
      -- Set custom window options
      opts.window = {
        completion = require("cmp").config.window.bordered(),
        documentation = require("cmp").config.window.bordered(),
      }
      -- Set custom highlights to remove transparency
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1e222a", fg = "#c5cdd9" })
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#3e4452", fg = "#c5cdd9" })
      vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#c5cdd9" })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#569cd6" })
      vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#56b6c2" })
      vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#c5cdd9" })
    end,
  },
}
