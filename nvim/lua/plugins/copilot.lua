return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    filetypes = {
      yaml = true,
      markdown = true,
      help = true,
    },
  },
}
