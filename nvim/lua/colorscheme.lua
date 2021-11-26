vim.g.material_style = "darker"
vim.cmd 'colorscheme material'

require("lualine").setup({
	options = {
		-- ... your lualine config
		theme = "material-nvim",
	},
})
