return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "loctvl842/monokai-pro.nvim", lazy = false }, -- Primary is loaded at startup

  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
      -- colorscheme = "tokyonight",
      -- colorscheme = "gruvbox",
      -- colorscheme = "catppuccin",
    },
  },
}
