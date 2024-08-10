return {
  -- Git viewer for nvim like emacs magit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim", -- optional

      "nvim-telescope/telescope.nvim", -- this or fzf
    },
    config = true,
    lazy = false, -- load on startup
  },
}
