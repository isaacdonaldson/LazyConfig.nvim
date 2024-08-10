return {
  -- add terminal to nvim
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      highlights = {
        Normal = { link = "Normal" },
        NormalNC = { link = "NormalNC" },
        NormalFloat = { link = "NormalFloat" },
        FloatBorder = { link = "FloatBorder" },
        StatusLine = { link = "StatusLine" },
        StatusLineNC = { link = "StatusLineNC" },
        WinBar = { link = "WinBar" },
        WinBarNC = { link = "WinBarNC" },
      },

      size = 10,

      ---@param t Terminal
      on_create = function(t)
        vim.opt.foldcolumn = "0"
        vim.opt.signcolumn = "no"
      end,

      direction = "float",
      float_opts = { border = "rounded" },
    },
  },
}
