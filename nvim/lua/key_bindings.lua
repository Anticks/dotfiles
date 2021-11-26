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
	["<leader>b"] = {
		name = "+buffer",
		f = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer Fuzzy Find" },
		t = { "<cmd>Telescope current_buffer_tags<cr>", "Current Buffer Tags" },
	},
})

wk.register({
	["<leader>g"] = {
		name = "+git",
		m = { "<cmd>Neogit<cr>", "Neogit Menu" },
		b = { "<cmd>Telescope git_branches<cr>", "Git Branches" },
		l = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Blame Line" },
		L = { "<cmd>Gitsigns blame_line<cr>", "Blame Line" },
		s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
		S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer" },
		p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
		r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
	},
})

wk.register({
	["<leader>c"] = {
		name = "+code/lsp",
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to Definition" },
		h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Information" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
	},
})


wk.register({
	["<leader>s"] = {
		name = "+settings",
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
	},
})

