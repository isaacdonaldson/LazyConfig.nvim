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
vim.keymap.set({ "n", "t", "i" }, "<C-\\>", "<cmd>execute v:count . 'ToggleTerm'<cr>", { desc = "Toggle terminal" })

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
