return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"hrsh7th/cmp-cmdline", -- source for command autocompletion
		},

		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			-- Setup some suggestion for search cmdline
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline({
					["<Down>"] = { c = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }) },
					["<Up>"] = { c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }) },
					["<CR>"] = { c = cmp.mapping.confirm({ behavior = cmp.mapping.confirm }) },
				}),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Setup commandline completion.
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline({
					["<Down>"] = { c = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }) },
					["<Up>"] = { c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }) },
					["<CR>"] = { c = cmp.mapping.confirm({ behavior = cmp.mapping.confirm }) },
				}),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						options = {
							ignore_cmds = { "Man", "!" },
						},
					},
				}),
			})

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
