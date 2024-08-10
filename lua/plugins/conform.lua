return {
  -- override conform formatting options
  {
    "stevearc/conform.nvim",
    opts = function()
      return {
        format = {
          -- change default format timeout to 5 seconds
          timeout_ms = 250,
        },
      }
    end,
  },
}
