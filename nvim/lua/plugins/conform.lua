return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      ["javascript"] = { "prettierd", "prettier", stop_after_first = true },
      ["javascriptreact"] = { "prettierd", "prettier", stop_after_first = true },
      ["typescript"] = { "prettierd", "prettier", stop_after_first = true },
      ["typescriptreact"] = { "prettierd", "prettier", stop_after_first = true },
      ["vue"] = { "prettierd", "prettier", stop_after_first = true },
      ["css"] = { "prettierd", "prettier", stop_after_first = true },
      ["scss"] = { "prettierd", "prettier", stop_after_first = true },
      ["less"] = { "prettierd", "prettier", stop_after_first = true },
      ["html"] = { "prettierd", "prettier", stop_after_first = true },
      ["json"] = { "prettierd", "prettier", stop_after_first = true },
      ["jsonc"] = { "prettierd", "prettier", stop_after_first = true },
      ["yaml"] = { "prettierd", "prettier", stop_after_first = true },
      ["markdown"] = { "prettierd", "prettier", stop_after_first = true },
      ["markdown.mdx"] = { "prettierd", "prettier", stop_after_first = true },
      ["graphql"] = { "prettierd", "prettier", stop_after_first = true },
      ["handlebars"] = { "prettierd", "prettier", stop_after_first = true },
    },
  },
}
