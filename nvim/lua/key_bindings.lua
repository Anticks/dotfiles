vim.g.mapleader = " "

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
-- NORMAL MODE BINDINGS
--

wk.register({
	["<leader>."] = { "<cmd>Neoformat<cr>", "Format file" },
})

wk.register({
	["<leader>/"] = { "<Plug>kommentary_line_default", "Komment line(s)" },
})

wk.register({
	["<leader>f"] = {
		name = "+file",
		r = { "<cmd>Telescope oldfiles<cr>", "Open recent file" },
		f = { "<cmd>Telescope find_files<cr>", "Find files" },
		l = { "<cmd>Telescope live_grep<cr>", "Live grep" },
		w = { "<cmd>Telescope grep_string<cr>", "Find word" },
		n = { "<cmd>enew<cr>", "New file" },
		t = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
		a = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Add file to harpoon" },
		H = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Open harpoon" },
		h = { "<cmd>Telescope harpoon marks<cr>", "Telescope tha harpoon!" },
	},
})

wk.register({
	["<leader>j"] = {
		name = "+hop/jump",
		w = { "<cmd>HopWord<cr>", "Jump to word" },
		l = { "<cmd>HopLineStart<cr>", "Jump to line" },
		c = { "<cmd>HopChar1<cr>", "Jump to 1 character" },
		C = { "<cmd>HopChar2<cr>", "Jump to 2 Characters" },
		p = { "<cmd>HopPattern<cr>", "Jump to pattern" },
	},
}, { mode = "n" })

wk.register({
	["<leader>b"] = {
		name = "+buffer",
		f = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current buffer fuzzy find" },
		t = { "<cmd>Telescope current_buffer_tags<cr>", "Current buffer tags" },
	},
})

wk.register({
	["<leader>g"] = {
		name = "+git",
		m = { "<cmd>Neogit<cr>", "Neogit menu" },
		M = { "<cmd>lua _lazygit_toggle()<cr>", "Lazygit menu" },
		b = { "<cmd>Telescope git_branches<cr>", "Git branches" },
		s = { "<cmd>Telescope git_status<cr>", "Git branches" },
		l = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle blame line" },
		L = { "<cmd>Gitsigns blame_line<cr>", "Blame line detail" },
		h = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
		B = { "<cmd>Gitsigns stage_buffer<cr>", "Stage buffer" },
		P = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
		r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
		n = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
		p = { "<cmd>Gitsigns prev_hunk<cr>", "Previous hunk" },
	},
})

wk.register({
	["<leader>c"] = {
		name = "+code/lsp",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
		h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover information" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format file" },
		t = { "<cmd>TroubleToggle<cr>", "Toggle trouble diagnostics" },
	},
})

wk.register({
	["<leader>s"] = {
		name = "+settings",
		c = { "<cmd>Telescope colorscheme<cr>", "Change colorscheme" },
		k = { "<cmd>e ~/.config/nvim/lua/key_bindings.lua<cr>", "Open Key bindings" },
		K = { "<cmd>e ~/.config/kitty/kitty.conf<cr>", "Open Kitty Configuration" },
		f = { "<cmd>e ~/.config/fish/config.fish<cr>", "Open Fish Configuration" },
		p = { "<cmd>e ~/.config/nvim/lua/plugins.lua<cr>", "Open Plugins" },
	},
})

wk.register({
	["<leader>t"] = {
		name = "+test",
		n = { "<cmd>TestNearest<cr>", "Test nearest file" },
		c = { "<cmd>TestFile<cr>", "Test current file" },
		S = { "<cmd>TestSuite<cr>", "Test suite" },
		v = { "<cmd>TestVisit<cr>", "Visit last test file" },
		l = { "<cmd>TestLast<cr>", "Run most recent test" },
		s = { "<cmd>SnipRun<cr>", "Run snippet of code" },
		d = { "<cmd>SnipClose<cr>", "Delete code snippets" },
	},
})

wk.register({
	["<leader>w"] = {
		name = "+words",
		d = { "<Plug>Dsurround", "Delete Surrounding" },
		c = { "<Plug>Csurround", "Change Surrounding" },
		s = { "<Plug>Ysurround", "You Surround" },
	},
})

--
-- VISUAL MODE BINDINGS
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
	["<leader>w"] = {
		name = "+words",
		s = { "<Plug>VSurround", "You Surround" },
	},
}, { mode = "v" })

wk.register({
	["<leader>t"] = {
		name = "+test",
		s = { "<Plug>SnipRun", "Run snippet of code" },
	},
}, { mode = "v" })
