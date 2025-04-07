return {
  -- This is for parsing languages and syntax highlighting
  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Add more treesitters here
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "c",
        "diff",
        "jsonc",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "tsx",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "xml",
        "astro",
      })
    end,
  },
}
