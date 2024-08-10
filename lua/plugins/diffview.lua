-- Diffs for git revisions.
-- https://github.com/MariaSolOs/dotfiles/blob/da291d841447ed7daddcf3f9d3c66ed04e025b50/.config/nvim/lua/plugins/diffview.lua#L6
return {
  {
    "sindrets/diffview.nvim",
    keys = {
      { "<leader>gf", "<cmd>DiffviewFileHistory %<cr>",                         desc = "Git File history (current)" },
      { "<leader>gd", "<cmd>DiffviewOpen<cr>",                                  desc = "Git Diff view" },
      -- https://github.com/sindrets/diffview.nvim/blob/main/USAGE.md#review-a-pr
      { "<leader>gr", "<cmd>DiffviewOpen origin/HEAD...HEAD --imply-local<cr>", desc = "PR Review" },
    },
    opts = function()
      require("diffview.ui.panel").Panel.default_config_float.border = "rounded"
    end,
  },
}
