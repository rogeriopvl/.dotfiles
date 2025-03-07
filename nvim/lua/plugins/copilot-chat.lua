return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      model = "claude-3.7-sonnet",
      mappings = {
        reset = {
          insert = "<C-r>",
          normal = "<C-r>",
        },
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
