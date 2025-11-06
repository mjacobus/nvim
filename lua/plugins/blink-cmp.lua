return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    "fang2hou/blink-copilot",
    'rafamadriz/friendly-snippets',
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      build = "make install_jsregexp"
    }
  },
  version = '1.*',
  build = 'cargo build --release',
  opts_extend = { "sources.default" },
  opts = {
    fuzzy = { implementation = "prefer_rust_with_warning" },
    keymap = {
      -- See :h blink-cmp-config-keymap for defining your own keymap
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
            { "label", "label_description", gap = 1 },
            -- { "kind" },
            { "source_name" },
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
  },
  config = function(_plugin, opts)
    local map = vim.keymap.set

    map("i", "<C-n>", function ()
      require('blink.cmp').show()
    end, { desc = "Display blink menu" })

    -- require("luasnip.loaders.from_vscode").lazy_load() NOTE: This is not working. Not sure I want it.
    require("blink.cmp").setup(opts)
  end,
}
