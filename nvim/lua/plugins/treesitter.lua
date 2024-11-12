return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"RRethy/nvim-treesitter-endwise",
	},
	config = function()
		local config = require("nvim-treesitter.configs")

		config.setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true, disable = { "yaml", "ruby" } },
			autotag = { enable = true },
			endwise = { enable = true },
		})

		vim.treesitter.language.register("markdown", "mdx")
		vim.treesitter.language.register("yaml", "mdx")
	end,
}
