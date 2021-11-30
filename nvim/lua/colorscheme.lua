vim.g.material_style = "darker"
vim.cmd("colorscheme material")

require("lualine").setup({
	options = {
		-- ... your lualine config
		theme = "material-nvim",
		section_separators = { left = "", right = "" },
		component_separators = "|",
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "" }, right_padding = 2 },
		},
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})
