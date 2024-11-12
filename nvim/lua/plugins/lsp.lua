return {
	{
		"williamboman/mason.nvim",

		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			local util = require("lspconfig/util")

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
			})

			vim.diagnostic.config({
				float = { border = "rounded" },
			})

			local lspconfig_ui_window = require("lspconfig.ui.windows")
			lspconfig_ui_window.default_options = {
				border = "rounded",
			}

			-- Lua language server
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			-- HTML language server
			lspconfig.html.setup({
				capabilities = capabilities,
			})

			-- CSS language server
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			-- TailwindCSS language server
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})

			-- TypeScript language server
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			-- Ruby and possibilly Ruby on Rails
			lspconfig.ruby_lsp.setup({
				capabilities = capabilities,
			})

			-- Go language server
			lspconfig.gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			})

			-- keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		end,
	},
}
