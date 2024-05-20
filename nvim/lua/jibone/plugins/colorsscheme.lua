-- loading the colorscheme

return {
  "folke/tokyonight.nvim",
  priority = 1000, -- make sure to load this before all the other stuff
  config = function()
    -- load the colorscheme here
    vim.cmd([[colorscheme tokyonight-day]])
    -- vim.g.transparent_enabled = true
  end,
}
