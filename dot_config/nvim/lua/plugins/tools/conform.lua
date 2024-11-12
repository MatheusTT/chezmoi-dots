return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      sh = { "shfmt" },
      bash = { "shfmt" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      javascript = { "prettier" },
      json = { "prettier" },
      lua = { "stylua" },
      python = { "ruff_format" },
      yaml = { "prettier" },
    },
    formatters = {
      ruff_format = {
        prepend_args = { "--config", "indent-width=2" },
      },
    },
  },
}
