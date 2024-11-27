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

			-- Configure Vue
			local mason_registry = require("mason-registry")
			local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
				.. "/node_modules/@vue/language-server"
			-- TypeScript language server
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_language_server_path,
							languages = { "vue" },
						},
					},
				},
				filetypes = {
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"vue",
				},
			})

			lspconfig.volor.setup({
				capabilities = capabilities,
			})

			-- lspconfig.vtsls.setup({
			-- 	capabilities = capabilities,
			-- })

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

			-- Markdown language server
			lspconfig.marksman.setup({
				capabilities = capabilities,
				filetypes = { "markdown", "markdown.mdx" },
			})

			-- MDX language server
			lspconfig.mdx_analyzer.setup({
				capabilities = capabilities,
				filetypes = { "markdown", "markdown.mdx" },
			})

			-- keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {})
			vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {})
		end,
	},
}
