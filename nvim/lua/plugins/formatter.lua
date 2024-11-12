return {
  "stevearc/conform.nvim",

  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        ruby = { "rubocop" },
        eruby = { "erb_format" },
        python = { "isort", "black" },
        go = { "goimports", "gofmt", "gofumpt", "golines" },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
    })
  end,
}