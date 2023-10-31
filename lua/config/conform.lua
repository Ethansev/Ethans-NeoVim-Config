return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      sh = { "shfmt" },
      zsh = { "" },
      javascript = { "prettier" },
      python = { "isort", "black" },
    },
  },
}
