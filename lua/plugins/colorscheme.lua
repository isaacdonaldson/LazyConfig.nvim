return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "loctvl842/monokai-pro.nvim", lazy = false }, -- Primary is loaded at startup
  { "nuvic/flexoki-nvim", name = "flexoki" }, -- Newvicks colorscheme

  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
      -- colorscheme = "flexoki",
      -- colorscheme = "tokyonight",
      -- colorscheme = "gruvbox",
      -- colorscheme = "catppuccin",
    },
  },
}
