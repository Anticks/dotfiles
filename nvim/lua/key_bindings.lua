local wk = require("which-key")

--
-- Lazygit terminal settings
--
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
	float_opts = { border = "double" },
})

function _lazygit_toggle()
	lazygit:toggle()
end

--
--
--

vim.g.mapleader = " "

wk.register({
	["<leader>."] = { "<cmd>Neoformat<cr>", "Format file" },
})

wk.register({
	["<leader>/"] = { "<Plug>kommentary_line_default", "Komment Line(s)" },
})

wk.register({
	["<leader>f"] = {
		name = "+file",
		r = { "<cmd>Telescope oldfiles<cr>", "Open recent file" },
		n = { "<cmd>enew<cr>", "New file" },
		t = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
	},
})

wk.register({
	["<leader>j"] = {
		name = "+hop/jump",
		w = { "<cmd>HopWord<cr>", "Word" },
		l = { "<cmd>HopLineStart<cr>", "Line" },
		c = { "<cmd>HopChar1<cr>", "1 Character" },
		C = { "<cmd>HopChar2<cr>", "2 Characters" },
		p = { "<cmd>HopPattern<cr>", "Search for Pattern" },
	},
}, { mode = "n" })

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
		M = { "<cmd>lua _lazygit_toggle()<cr>", "Lazygit Menu" },
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
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
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

wk.register({
	["<leader>t"] = {
		name = "+text",
		d = { "<Plug>Dsurround", "Delete Surrounding" },
		c = { "<Plug>Csurround", "Change Surrounding" },
		s = { "<Plug>Ysurround", "You Surround" },
	},
})

--
-- VISUAL MODE
--
wk.register({
	["<leader>/"] = { "<Plug>kommentary_visual_default", "Komment Line(s)" },
}, { mode = "v" })

wk.register({
	["<leader>j"] = {
		name = "+hop/jump",
		w = { "<cmd>HopWord<cr>", "Word" },
		l = { "<cmd>HopLineStart<cr>", "Line" },
		c = { "<cmd>HopChar1<cr>", "1 Character" },
		C = { "<cmd>HopChar2<cr>", "2 Characters" },
		p = { "<cmd>HopPattern<cr>", "Search for Pattern" },
	},
}, { mode = "v" })

wk.register({
	["<leader>t"] = {
		name = "+text",
		s = { "<Plug>VSurround", "You Surround" },
	},
}, { mode = "v" })
