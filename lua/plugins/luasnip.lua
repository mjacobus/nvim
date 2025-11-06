return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  enabled = false,
  keys = function()
    return {
      {
        "<Tab>",
        function()
          return require("luasnip").expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<Tab>"
        end,
        expr = true,
        mode = "i",
      },
      {
        "<S-Tab>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = "i",
      },
    }
  end,
  init = function()
    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })
  end,
}
