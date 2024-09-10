return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            sh = { "shfmt" },
            zsh = { "" },
            javascript = { "prettierd", "prettier" },
            python = { "isort", "black" },
            lua = { "stylua" },
        },
    },
}
