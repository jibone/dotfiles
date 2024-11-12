return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup({
			openai_params = {
				model = "gpt-4o",
			},
		})

		local keymap = vim.keymap

		-- Show ChatGPT Windoe
		keymap.set("n", "<leader>cg", "<cmd>ChatGPT<CR>", { desc = "Show ChatGPT window " })

		-- Complete the code
		keymap.set("n", "<leader>cc", "<cmd>ChatGPTCompleteCode<CR>", { desc = "ChatGPT complete code" })
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
