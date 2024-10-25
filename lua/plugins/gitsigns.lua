return {
  "lewis6991/gitsigns.nvim",
  current_line_blame = false,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    -- Stage hunk
    -- vim.keymap.set("n", "<leader>ga", gs.stage_hunk, { buffer = bufnr })
    vim.keymap.set("v", "<leader>ga", function()
      gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { buffer = bufnr })

    -- Stage buffer
    vim.keymap.set("n", "<leader>ga", gs.stage_buffer, { buffer = bufnr })
  end,
}
