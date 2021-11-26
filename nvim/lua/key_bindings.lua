local wk = require("which-key")
vim.g.mapleader = " "
-- As an example, we will the create following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

wk.register({
	["<leader>f"] = {
		name = "+file",
		f = { "<cmd>Telescope find_files<cr>", "Find file" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open recent file" }, n = { "<cmd>enew<cr>", "New file" },
		t = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
	},
})

wk.register({
	["<leader>."] = { "<cmd>Neoformat<cr>", "Format file" },
})

wk.register({
	["<leader>h"] = {
		name = "+hop/jump",
		w = { "<cmd>HopWord<cr>", "Word" },
		l = { "<cmd>HopLineStart<cr>", "Line" },
		c = { "<cmd>HopChar1<cr>", "1 Character" },
		C = { "<cmd>HopChar2<cr>", "2 Characters" },
		p = { "<cmd>HopPattern<cr>", "Search for Pattern" },
	},
})
