local M = {}

-- A Lua-native split function that splits a string by a given delimiter
local function lua_split(input_str, delimiter)
  local result = {}
  for match in (input_str .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, match)
  end
  return result
end

M.snake_case_to_ruby_class = function(path)
  -- Remove .rb suffix if present
  path = path:gsub("%.rb$", "")

  -- Split by slash and convert each part to CamelCase
  local parts = lua_split(path, "/")
  for i, part in ipairs(parts) do
    parts[i] = part
      :gsub("_(%a)", function(letter)
        return letter:upper()
      end)
      :gsub("^%a", string.upper)
  end

  -- Join parts with "::" to form the Ruby class name
  local ruby_class = table.concat(parts, "::")
  return ruby_class
end

M.replace_selected_text_with_ruby_class = function()
  -- Get the current visual selection
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  -- Get the lines in the selected region
  local lines = vim.fn.getline(start_pos[2], end_pos[2])

  -- If there's more than one line, we join them into one string
  local selected_text = table.concat(lines, "\n")

  -- Get the exact selection from the start column to the end column
  selected_text = string.sub(selected_text, start_pos[3], end_pos[3])

  -- Convert the selected text to Ruby class format
  local ruby_class = M.snake_case_to_ruby_class(selected_text)

  -- Replace the selected text with the converted Ruby class
  vim.fn.setline(start_pos[2], ruby_class)
end

M.insert_ruby_class_based_on_file_path = function()
  -- Get the full file path
  local filepath = vim.fn.expand("%:.")

  -- Remove the .rb suffix if present
  filepath = filepath:gsub("%.rb$", "")

  -- Convert the file path to Ruby class format
  local ruby_class = M.snake_case_to_ruby_class(filepath)

  -- Insert the class name at the current cursor position
  vim.api.nvim_put({ ruby_class }, "c", true, true)
end

return M
