return {
	"stevearc/conform.nvim",

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				ruby = { "rubocop" },
				eruby = { "erb_format" },
				python = { "isort", "black" },
				go = { "goimports", "gofmt", "gofumpt", "golines" },
				markdown = { "prettier", "markdownlint-cli2", "markdown-toc" },
				["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
				vue = { "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
		})
	end,
}
