require("toggleterm").setup({
	direction = "float",
	close_on_exit = true, -- close the terminal window when the process exits
	-- This field is only relevant if direction is set to 'float'
	float_opts = {
		border = "double",
	},
})
