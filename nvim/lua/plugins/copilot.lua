return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {},
		keys = {
			{
				"<leader>zc",
				":CopilotChat<CR>",
				mode = "n",
				desc = "Open Copilot Chat",
			},
		},
	},
}
