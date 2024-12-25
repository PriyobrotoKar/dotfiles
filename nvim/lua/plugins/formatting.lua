return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      svelte = { "prettier" },
      astro = { "prettierd" },
      css = { "prettierd" },
      html = { "prettierd" },
      json = { "prettier" },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
      graphql = { "prettier" },
      liquid = { "prettier" },
      lua = { "stylua" },
      python = { "isort", "black" },
    },
  },
}
