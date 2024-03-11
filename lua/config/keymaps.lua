-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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

vim.keymap.set("n", "<F7>", "<cmd>execute v:count . 'ToggleTerm'<cr>", { desc = "Toggle terminal" })
vim.keymap.set("i", "<F7>", "<cmd>execute v:count . 'ToggleTerm'<cr>", { desc = "Toggle terminal" })
vim.keymap.set("t", "<F7>", "<cmd>execute v:count . 'ToggleTerm'<cr>", { desc = "Toggle terminal" })

vim.keymap.set("n", "<C-'>", "<cmd>execute v:count . 'ToggleTerm'<cr>", { desc = "Toggle terminal" })
vim.keymap.set("i", "<C-'>", "<cmd>execute v:count . 'ToggleTerm'<cr>", { desc = "Toggle terminal" })
vim.keymap.set("t", "<C-'>", "<cmd>execute v:count . 'ToggleTerm'<cr>", { desc = "Toggle terminal" })

-- Set up neogit
vim.keymap.set("n", "<leader>gnt", "<cmd>Neogit<cr>", { desc = "Neogit tab page" })
