return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"s1n7ax/nvim-window-picker",
	},

	config = function()
		require("window-picker").setup({
			filter_rules = {
				include_current_win = false,
				autoselect_one = true,
				bo = {
					filetype = { "neo-tree", "neo-tree-popup", "notify" },
					bufftype = { "terminal", "quickfix" },
				},
			},
		})

		require("neo-tree").setup({
			close_if_last_window = true, -- close neo-tree if last window.
			default_component_configs = {
				window = {
					position = "right",
					mappings = {
						["<CR>"] = "open_with_window_picker", -- TODO: check why window picker is not working.
						["S"] = "split_with_window_picker",
						["s"] = "vsplit_with_window_picker",
					},
				},
			},
			event_handlers = {
				{
					event = "file_open_requested",
					handler = function()
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})

		vim.keymap.set("n", "<leader>ee", ":Neotree filesystem reveal right<CR>", {})
	end,
}
