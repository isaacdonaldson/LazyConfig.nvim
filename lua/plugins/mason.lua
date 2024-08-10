return {
  -- add any tools you want to have installed below
  -- This is where you can install and manage LSPs
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
}
