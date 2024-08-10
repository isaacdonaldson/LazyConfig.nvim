return {
  { import = "lazyvim.plugins.extras.coding.copilot" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.ruby" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  { import = "lazyvim.plugins.extras.lang.markdown" },
  { import = "lazyvim.plugins.extras.lang.docker" },
  -- { import = "lazyvim.plugins.extras.ui.mini-animate" },

  -- use mini.starter instead of alpha
  {
    import = "lazyvim.plugins.extras.ui.mini-starter",
    opts = function()
         local logo = table.concat({
           "                        ███████╗███████╗ █████╗ ██╗  ██╗          K            ",
           "                        ██╔════╝██╔════╝██╔══██╗██║ ██╔╝      K                ",
           "                        █████╗  ███████╗███████║█████╔╝    k                   ",
           "                        ██╔══╝  ╚════██║██╔══██║██╔═██╗  k                     ",
           "                        ███████╗███████║██║  ██║██║  ██╗                       ",
           "                        ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝                       ",
         }, "\n")
         local pad = string.rep(" ", 22)
         local new_section = function(name, action, section)
           return { name = name, action = action, section = pad .. section }
         end

         local starter = require("mini.starter")
         --stylua: ignore
         local config = {
           evaluate_single = true,
           header = logo,
           items = {
             new_section("Find file",       LazyVim.pick(),                        "Telescope"),
             new_section("New file",        "ene | startinsert",                   "Built-in"),
             new_section("Recent files",    LazyVim.pick("oldfiles"),              "Telescope"),
             new_section("Find text",       LazyVim.pick("live_grep"),             "Telescope"),
             new_section("Config",          LazyVim.pick.config_files(),           "Config"),
             new_section("Restore session", [[lua require("persistence").load()]], "Session"),
             new_section("Lazy Extras",     "LazyExtras",                          "Config"),
             new_section("Lazy",            "Lazy",                                "Config"),
             new_section("Quit",            "qa",                                  "Built-in"),
           },
           content_hooks = {
             starter.gen_hook.adding_bullet(pad .. "░ ", false),
             starter.gen_hook.aligning("center", "center"),
           },
         }
         return config
       end,
  },
}
