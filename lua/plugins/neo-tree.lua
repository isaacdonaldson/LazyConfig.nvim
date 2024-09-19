return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          visible = true, -- dim hidden files
          hide_dotfiles = false,
          hide_gitignored = false,
          never_show = {
            ".git",
            ".DS_Store",
          },
        },
      },
    },
  },
}
