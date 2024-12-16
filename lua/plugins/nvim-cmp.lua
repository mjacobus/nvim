local supertab = function(opts)
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    if col == 0 then
      return false
    end
    local line_text = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
    local char_before_cursor = line_text:sub(col, col)
    return not char_before_cursor:match("%s") or char_before_cursor:match("[./]")
  end

  local cmp = require("cmp")

  local prev = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif vim.snippet.active({ direction = -1 }) then
      vim.schedule(function()
        vim.snippet.jump(-1)
      end)
    else
      fallback()
    end
  end, { "i", "s" })

  opts.mapping = vim.tbl_extend("force", opts.mapping, {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.snippet.active({ direction = 1 }) then
        vim.schedule(function()
          vim.snippet.jump(1)
        end)
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = prev,
  })
end

local function sources(opts)
  opts.sources = vim.tbl_extend("force", opts.sources or {}, {
    {
      name = "path",
      option = {
        trailing_slash = true, -- Adds a trailing slash to directories
      },
    },
    { name = "buffer" },
  })
end

local function format(opts)
  opts.formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  }

  opts.window = {
    completion = require("cmp").config.window.bordered(),
    documentation = require("cmp").config.window.bordered(),
  }
end

return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      supertab(opts)
      format(opts)
      sources(opts)
    end,
  },
}
