return {
  {
    "nvimdev/dashboard-nvim",
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    opts = function(_, opts)
      local logo = [[
          ███████╗███████╗ █████╗ ██╗  ██╗         K
        ██╔════╝██╔════╝██╔══██╗██║ ██╔╝       K
    █████╗  ███████╗███████║█████╔╝     k
  ██╔══╝  ╚════██║██╔══██║██╔═██╗  k
███████╗███████║██║  ██║██║  ██╗
╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝
          ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      opts.config.header = vim.split(logo, "\n")
      opts.theme = "doom"
    end,
  },
}
