-- NOTE: conflicts with lua/plugins/cmp.lua
local map = vim.keymap.set

map("i", "<C-n>", function ()
  require('blink.cmp').show()
end, { desc = "Display blink menu" })

return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    'rafamadriz/friendly-snippets',
    "fang2hou/blink-copilot",
  },
  version = '1.*',
  build = 'cargo build --release',
  opts_extend = { "sources.default" },
  opts = {
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      preset = 'default',
    },
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = {
      menu = {
        -- border = nil,
        scrolloff = 1,
        scrollbar = false,
        draw = {
          columns = {
            { "kind_icon" },
            { "label",      "label_description", gap = 1 },
            { "kind" },
            -- { "source_name" },
          },
        },
      },
      documentation = {
        window = {
          border = nil,
          scrollbar = false,
          winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
        },
        auto_show = true,
        auto_show_delay_ms = 500,
      },
    },
    sources = {
      default = {
        'lsp',
        'path',
        'snippets',
        'buffer',
        'copilot',
      },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          async = true,
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  config = function(_plugin, opts)
    require("blink.cmp").setup(opts)
  end,
}
