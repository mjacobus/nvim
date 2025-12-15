return {
  {
    "zbirenbaum/copilot.lua",  -- Or use the official "github/copilot.vim" if preferred
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },  -- Disable inline ghost text
      panel = { enabled = false },      -- Disable panel
    },
  },
  {
    "fang2hou/blink-copilot",
  },
  {
    "Saghen/blink.cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "fang2hou/blink-copilot",  -- Add as dependency
    },
    opts = {
      sources = {
        default = {
          "lsp",
          "snippets",
          "buffer",
          "path",
          "copilot",  -- Add copilot to the list
        },

        providers = {
          copilot = {
            name = "Copilot",          -- Display name in menu
            module = "blink-copilot",  -- The module providing the source
            async = true,
            score_offset = 5,          -- Higher = better priority (adjust as needed)
            opts = {                   -- Optional blink-copilot specific options
              max_completions = 3,
              debounce = 750,
              auto_refresh = { backward = true, forward = true },
            },
          },
        },
      }, -- sources

      keymap = {
        -- No preset – fully custom to match nvim-cmp exactly
        preset = "none",

        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },

        ["<C-b>"] = { "scroll_documentation_down", "fallback" },
        ["<C-f>"] = { "scroll_documentation_up", "fallback" },

        ["<C-Space>"] = { "show", "fallback" },  -- Manual trigger
        ["<C-e>"] = { "hide", "fallback" },

        ["<CR>"] = { "select_and_accept", "fallback" },  -- Matches confirm({ select = true })

        -- Super-tab like behavior for Tab/S-Tab
        ["<Tab>"] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.select_next()
            elseif cmp.snippet_active({ direction = 1 }) then
              return cmp.snippet_forward()
            end
            return nil  -- fallback
          end,
          "fallback",
        },
        ["<S-Tab>"] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.select_prev()
            elseif cmp.is_snippet_jumpable(-1) then  -- Handles luasnip.jumpable(-1)
              return cmp.snippet_backward()
            end
            return nil  -- fallback to normal <S-Tab>
          end,
          "fallback",
        },
      }, -- presset

      completion = {
        menu = { border = 'single' },
        documentation = { window = { border = 'single' } },
        list = {
          selection = {
            preselect = true
          }
        }
      },
      signature = { window = { border = 'single' } },

      --
    }, -- opts
  }, -- blink.cmp
}
