return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	---@module 'render-markdown'
	opts = {},
	config = function()
		require("render-markdown").setup({
			file_types = { "markdown.mdx", "markdown", "vimwiki" },
		})
	end,
}
