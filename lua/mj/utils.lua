local M = {}

M.close_terminal_buffer = function(new_tab)
  local name = vim.api.nvim_buf_get_name(0)

  if string.find(name, "term://") then
    if not new_tab then
      local number = vim.api.nvim_buf_get_number(0)
      vim.api.nvim_exec("buffer #", true)
      vim.api.nvim_buf_delete(number, { force = true })
      return
    end

    vim.api.nvim_command("bdelete!")
  end
end

function M.branch_files(opts)
  opts = opts or {}
  local include_deleted = opts.include_deleted or false

  -- Get current branch; if empty, we're probably not in a git repo.
  local current_branch = vim.fn.systemlist("git branch --show-current")[1]
  if not current_branch or current_branch == "" then
    print("Not inside a git repository!")
    return
  end

  -- Check if master exists: if so, use origin/master, else origin/main.
  vim.fn.system("git rev-parse --verify master > /dev/null 2>&1")
  local base_branch = (vim.v.shell_error == 0) and "origin/master" or "origin/main"

  -- If not including deleted files, filter them out.
  local diff_filter = include_deleted and "" or "--diff-filter=d"
  local git_cmd =
    string.format("git diff --name-status %s %s...%s | awk '{print $2}'", diff_filter, base_branch, current_branch)
  local files = vim.fn.systemlist(git_cmd)

  -- Filter the list to include only existing files
  local existing_files = {}
  for _, file in ipairs(files) do
    if vim.loop.fs_stat(file) then
      table.insert(existing_files, file)
    end
  end

  return existing_files
end

M.branch_files()

return M
