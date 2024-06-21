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
    end,
  },
}
