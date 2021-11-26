local wk = require("which-key")
vim.g.mapleader = " "

wk.register({
	["<leader>f"] = {
		name = "+file",
		f = { "<cmd>Telescope find_files<cr>", "Find file" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open recent file" },
		n = { "<cmd>enew<cr>", "New file" },
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

wk.register({
	["<leader>g"] = {
		name = "+git",
		m = { "<cmd>Neogit<cr>", "Neogit Menu" },
		b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Blame Line" },
		B = { "<cmd>Gitsigns blame_line<cr>", "Blame Line" },
		s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
		S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer" },
		p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
		r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
	},
})
