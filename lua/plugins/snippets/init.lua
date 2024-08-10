return {
  -- Create snippets to use when getting recommendations
  {
    "chrisgrieser/nvim-scissors",
    dependencies = { "nvim-telescope/telescope.nvim", "garymjr/nvim-snippets" },
    opts = {
      snippetDir = ".",
    }
  },

}
