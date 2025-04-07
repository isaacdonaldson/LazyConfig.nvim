-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- -- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Remap up/down for dealing with word wrap
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Add toggling of comment blocks
vim.keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end, { desc = "Toggle comment line" })

vim.keymap.set(
  "v",
  "<leader>/",
  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  { desc = "Toggle comment line" }
)

-- Add creating and remove bindings to terminal
vim.keymap.set(
  "n",
  "<leader>th",
  "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
  { desc = "ToggleTerm horizontal split" }
)

vim.keymap.set(
  "n",
  "<leader>tv",
  "<cmd>ToggleTerm size=40 direction=vertical<cr>",
  { desc = "ToggleTerm vertical split" }
)

vim.keymap.set({ "n", "t", "i" }, "<C-'>", "<cmd>execute v:count . 'ToggleTerm'<cr>", { desc = "Toggle terminal" })
vim.keymap.set({ "n", "t", "i" }, "<F7>", "<cmd>execute v:count . 'ToggleTerm'<cr>", { desc = "Toggle terminal" })
vim.keymap.set({ "n", "t", "i" }, "<C-/>", "<cmd>execute v:count . 'ToggleTerm'<cr>", { desc = "Toggle terminal" })

vim.keymap.set({ "n", "t", "i" }, "<leader><C-/>h", function()
  local term_num = #vim.api.nvim_tabpage_list_wins(0)
  vim.cmd((term_num + 1) .. "ToggleTerm direction=vertical")
end, { desc = "Split terminal horizontal" })

vim.keymap.set({ "n", "t", "i" }, "<leader><C-/>v", function()
  local term_num = #vim.api.nvim_tabpage_list_wins(0)
  vim.cmd((term_num + 1) .. "ToggleTerm direction=horizontal")
end, { desc = "Split terminal vertically" })

-- Set up neogit
vim.keymap.set("n", "<leader>gnt", "<cmd>Neogit<cr>", { desc = "Neogit tab page" })

-- Add new binding for telescope searching words
vim.keymap.set("n", "<leader>fw", function()
  require("telescope.builtin").live_grep()
end, { desc = "Find words" })
vim.keymap.set("n", "<leader>fW", function()
  require("telescope.builtin").live_grep({
    additional_args = function(args)
      return vim.list_extend(args, { "--hidden", "--no-ignore" })
    end,
  })
end, { desc = "Find words in all files (hidden & ignored)" })

-- Add new binding for telescope searching files
vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, { desc = "Find words" })
vim.keymap.set("n", "<leader>fF", function()
  require("telescope.builtin").find_files({
    additional_args = function(args)
      return vim.list_extend(args, { "--hidden", "--no-ignore" })
    end,
  })
end, { desc = "Find all files (hidden & ignored)" })

-- Add markdown viewing using Glow
vim.keymap.set("n", "<leader>mv", "<cmd>Glow<cr>", { desc = "View current Markdown file" })

-- Set mapping for moving between tabs
vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Focus previous buffer" })
vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Focus next buffer" })

-- Set mapping for moving tab forwards and backwards
vim.keymap.set("n", "<b", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer back" })
vim.keymap.set("n", ">b", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer forward" })

-- Copy Utilities
vim.keymap.set({ "n", "v" }, "<leader>cpf", "<cmd>CopyRelPath<cr>", { desc = "Copy filename" })
vim.keymap.set({ "n", "v" }, "<leader>cpb", "<cmd>CopyCodeBlock<cr>", { desc = "Copy codeblock" })

-- History of function
vim.keymap.set({ "n", "v" }, "<leader>gt", "<cmd>TraceFunction<cr>", { desc = "Trace function" })

-- Git blame
vim.keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "Git Blame" })

-- Snippets
vim.keymap.set("n", "<leader>ne", function()
  require("scissors").editSnippet()
end, { desc = "Edit a code snippet" })

-- when used in visual mode, prefills the selection as snippet body
vim.keymap.set({ "n", "x" }, "<leader>na", function()
  require("scissors").addNewSnippet()
end, { desc = "Add a new code snippet" })

-- Hightlight the next occurence of word under cursors
vim.keymap.set(
  "n",
  "gl",
  "<cmd>SearchNextTextOccurence<cr>",
  { desc = "Change occurences of text under the cursor", noremap = true }
)

vim.keymap.set(
  "v",
  "gl",
  "<cmd>SearchNextTextOccurence<cr>",
  { desc = "Highlight an occurence of the word under the cursor", silent = true }
)

vim.keymap.set(
  "n",
  "<leader>K",
  "<cmd> lua vim.diagnostic.open_float() <CR>",
  { desc = "Toggles local troubleshoot diaglog window", noremap = true }
)

vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", { desc = "Enter normal mode in terminal mode", noremap = true })

-- Navigate to a mark
for i = 1, 9 do
  local mark_char = string.char(64 + i)
  vim.keymap.set("n", "<leader>" .. i, function()
    local mark_pos = vim.api.nvim_get_mark(mark_char, {})
    if mark_pos[1] ~= 0 then
      vim.cmd("normal! `" .. mark_char) -- Jump to the mark
    else
      vim.notify("No mark set for '" .. i .. "' (" .. mark_char .. ")")
    end
  end, { desc = "Go to mark " .. i .. " (" .. mark_char .. ")" })
end

-- Set a mark
for i = 1, 9 do
  local mark_char = string.char(64 + i)
  vim.keymap.set("n", "<leader>ms" .. i, function()
    vim.cmd("delmarks " .. mark_char)
    vim.cmd("mark " .. mark_char)
    vim.notify("Mark set for '" .. i .. "' (" .. mark_char .. ")")
  end, { desc = "Set mark " .. i .. " (" .. mark_char .. ")" })
end

-- Delete a mark
for i = 1, 9 do
  local mark_char = string.char(64 + i)
  vim.keymap.set("n", "<leader>md" .. i, function()
    vim.cmd("delmarks " .. mark_char)
    vim.notify("Mark '" .. i .. "' deleted (" .. mark_char .. ")")
  end, { desc = "Delete mark " .. i .. " (" .. mark_char .. ")" })
end

-- List all marks
vim.keymap.set("n", "<leader>ml", function()
  -- list to hold quickfix items
  local qf_list = {}

  for i = 1, 9 do
    local mark_char = string.char(64 + i)
    local mark_pos = vim.api.nvim_get_mark(mark_char, {})

    if mark_pos[1] ~= 0 then
      local buf_num = mark_pos[3]
      local buf_name = vim.api.nvim_get_buf_name(buf_num)

      if buf_num == 0 then
        buf_name = mark_pos[4]
      end

      table.insert(qf_list, {
        bufnr = buf_num,
        filename = buf_name,
        lnum = mark_pos[1],
        col = mark_pos[2],
        text = i,
      })
    end
  end

  -- Set quickfix list
  vim.fn.setqflist(qf_list)

  -- Open quickfix window if there are marks
  if #qf_list > 0 then
    vim.cmd("copen")
  else
    vim.notify("No marks set")
    vim.cmd("cclose")
  end
end, { desc = "List all marks" })
