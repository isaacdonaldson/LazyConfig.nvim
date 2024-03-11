-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- -- TIP: Disable arrow keys in normal mode
-- vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

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

-- Add new binding for telescope searching
vim.keymap.set("n", "<leader>fw", function()
  require("telescope.builtin").live_grep()
end, { desc = "Find words" })
vim.keymap.set("n", "<leader>fW", function()
  require("telescope.builtin").live_grep({
    additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
  })
end, { desc = "Find words in all files (hidden & ignored)" })
