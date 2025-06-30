vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local project_config = vim.fn.getcwd() .. "/.project.lua"
    if vim.fn.filereadable(project_config) == 1 then
      dofile(project_config)
    end
  end,
})

-- remove trailing spaces
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd("%s/\\s\\+$//e")
  end,
})

