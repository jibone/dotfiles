return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {
			ui = {
				border = "rounded",
			},
		},
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
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
			})

			vim.diagnostic.config({
				float = { border = "rounded" },
			})

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("html")
			vim.lsp.enable("cssls")
			vim.lsp.enable("tailwindcss")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("ruby_lsp")
			vim.lsp.enable("gopls")
			vim.lsp.enable("marksman")
			vim.lsp.enable("mdx_analyzer")

			vim.lsp.config.lua_ls = {
				capabilities = capabilities,
			}

			vim.lsp.config.html = {
				capabilities = capabilities,
			}

			vim.lsp.config.cssls = {
				capabilities = capabilities,
			}

			vim.lsp.config.tailwindcss = {
				capabilities = capabilities,
			}

			vim.lsp.config.ts_ls = {
				capabilities = capabilities,
				filetypes = {
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"vue",
				},
				root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
			}

			vim.lsp.config.ruby_lsp = {
				capabilities = capabilities,
			}

			vim.lsp.config.gopls = {
				capabilities = capabilities,
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_markers = { "go.work", "go.mod", ".git" },
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			}

			vim.lsp.config.marksman = {
				capabilities = capabilities,
				filetypes = { "markdown", "markdown.mdx" },
			}

			vim.lsp.config.mdx_analyzer = {
				capabilities = capabilities,
				filetypes = { "markdown", "markdown.mdx" },
			}

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then
						return
					end

					local bufnr = args.buf
					local opts = { buffer = bufnr }

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
				end,
			})
		end,
	},
}
