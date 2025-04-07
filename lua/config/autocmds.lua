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

-- Search and replace
vim.api.nvim_create_user_command("SearchNextTextOccurence", function()
  local mode = vim.api.nvim_get_mode().mode
  local text = ""

  local function make_replacement()
    local search = vim.fn.escape(text, "/.*$^~[")
    local count = vim.fn.searchcount({ re = search, timeout = 500 }).total
    local hlsearch_setting = vim.opt.hlsearch

    -- Enable search highlighting
    vim.opt.hlsearch = true

    -- Higlight every occurence of the text
    -- vim.api.nvim_command("normal! *")

    local replacement = vim.fn.input("Replace '" .. search .. "'  with: ")

    if replacement == "" then
      -- Restore hlsearch setting
      vim.opt.hlsearch = hlsearch_setting
      return
    end

    require("notify")("Replacing '" .. search .. "' with '" .. replacement .. "'" .. " (" .. count .. " times)")
    local cursor_pos = vim.fn.getpos(".")

    vim.api.nvim_command(":.,$s/" .. search .. "/" .. vim.fn.escape(replacement, "/") .. "/gc")
    vim.api.nvim_command(":0,.s/" .. search .. "/" .. vim.fn.escape(replacement, "/") .. "/gc")

    vim.fn.cursor(cursor_pos[1], cursor_pos[2])

    -- Restore hlsearch setting
    vim.opt.hlsearch = hlsearch_setting
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

-- Generate a UUID v4 with ":Uuid"
vim.api.nvim_create_user_command("Uuid", function()
  local uuid_command = "uuidgen | tr '[:upper:]' '[:lower:]' | tr -d '\n' | pbcopy && pbpaste"

  local uuid = vim.fn.system(uuid_command)

  vim.fn.setreg("+", uuid)
  vim.notify("Generated UUID: '" .. uuid .. "' and copied to clipboard", "info", {
    title = "UUID v4",
    timeout = 5000,
  })
end, {})

-- Generate a UUID v4 with ":Uuid"
vim.api.nvim_create_user_command("Utc", function()
  local time_command = "TZ=UTC date '+%Y-%m-%d %H:%M:%S %Z' && date"

  local time = vim.fn.system(time_command)

  vim.notify("Current time in UTC is:\n\t" .. time, "info", {
    title = "UTC Time",
    timeout = 10000,
  })
end, {})
