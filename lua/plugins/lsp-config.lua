return {
  -- add format options to lspconfig
  -- This is how LSPs interact with Neovim
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
    },
    ---@class PluginLspOpts
    opts = {
      format = {
        -- 0.5 second format timeout
        timeout_ms = 500,
      },

      servers = {
        pyright = {},
        astro = {},

        solargraph = {
          settings = {
            solargraph = {
              formatting = false,
            },
          },
        },

        tsserver = {
          -- keys = {
          --   { "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", { desc = "Organize Imports" } },
          --   { "<leader>cR", "<cmd>TypescriptRenameFile<CR>",      { desc = "Rename File" } },
          -- },
        },
      },

      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },
}
