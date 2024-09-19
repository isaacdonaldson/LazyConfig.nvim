-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-------------------------------------
-- user commands
-------------------------------------
-- Get the relative path of the current file and copy it to the clipboard
vim.api.nvim_create_user_command("CopyRelPath", function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- Get the git log of the function under the cursor
vim.api.nvim_create_user_command("TraceFunction", function()
  -- Get the function name under the cursor
  local function_name = vim.fn.expand("<cword>")

  -- Get the current file path
  local file_path = vim.fn.expand("%:p")

  -- Construct the git log command
  local git_command = string.format("git log -L :%s:%s", function_name, file_path)

  -- Execute the git log command and capture the output
  local output = vim.fn.system(git_command)

  -- Open a new tab
  vim.cmd("tabnew")

  -- Set the buffer content to the git log output
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(output, "\n"))

  -- Set the buffer to read-only
  vim.bo.modifiable = false
  vim.b.modifiable = false
  vim.bo.readonly = true
  vim.bo.buftype = "nofile"

  -- Set the filetype to 'git' for proper syntax highlighting
  vim.bo.filetype = "git"
end, {})

-- Copy text to clipboard using codeblock format ```{ft}{content}```
vim.api.nvim_create_user_command("CopyCodeBlock", function(opts)
  local lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, true)
  local content = table.concat(lines, "\n")
  local result = string.format("```%s\n%s\n```", vim.bo.filetype, content)
  vim.fn.setreg("+", result)
  vim.notify("Text copied to clipboard")
end, { range = true })

vim.api.nvim_create_user_command("SearchNextTextOccurence", function()
  local mode = vim.api.nvim_get_mode().mode
  local text = ""

  local function make_replacement()
    -- Get current value of autopairs
    local autopairs = vim.g.AutoPairs
    -- Turn it off for replace command
    vim.g.AutoPairs = 0
    local replacement = vim.fn.input("Replace with: ")
    -- Turn it back on after the replace command
    vim.g.AutoPairs = autopairs

    if replacement == "" then
      return
    end

    require("notify")("'" .. text .. "' replaced with '" .. replacement .. "'")
    local cursor_pos = vim.fn.getpos(".")
    vim.api.nvim_command(":%s/" .. vim.fn.escape(text, "/") .. "/" .. replacement .. "/gc")
    vim.fn.cursor(cursor_pos[1], cursor_pos[2])
  end

  if mode == "n" then
    -- Normal mode: get the word under the cursor
    local word = vim.fn.expand("<cword>")
    if word ~= "" then
      text = word
      make_replacement()
    end
  elseif mode == "v" or mode == "V" or mode == "" then
    vim.cmd('noau normal! "vy"')
    local words = vim.fn.getreg("v")
    vim.fn.setreg("v", {})

    if words ~= "" then
      text = words
      make_replacement()
    end
  end
end, {})
