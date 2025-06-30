-- [DEPRECATED] The configuration of `claude` should be placed in `providers.claude`. For detailed migration instructions,
-- [DEPRECATED] The configuration of `claude.max_tokens` should be placed in `providers.claude.extra_request_body.max_toke
-- ns`; for detailed migration instructions, please visit: https://github.com/yetone/avante.nvim/wiki/Provider-configurati
-- [DEPRECATED] The configuration of `openai` should be placed in `providers.openai`. For detailed migration instructions,
--  please visit: https://github.com/yetone/avante.nvim/wiki/Provider-configuration-migration-guide

return {
  "yetone/avante.nvim",
  enabled = true,
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    -- add any opts here
    -- for example
    -- provider = "openai",
    provider = "claude",
    providers = {
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20241022",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.3, -- Slightly increased for better balance
          max_tokens = 2048, -- Reduced to save costs while still being effective
        }
      },
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
        timeout = 30000,
        extra_request_body = {
          temperature = 0.3,
          max_completion_tokens = 2048, -- Reduced to save costs
        }
      },
    }
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
