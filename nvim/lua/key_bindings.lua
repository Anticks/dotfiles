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

wk.register({ ["<leader>."] = { "<cmd>Format<cr>", "Format file" } })
wk.register({ ["<leader>i"] = { "<cmd>set nolist<cr>", "Remove indents" } })

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
	},
})

wk.register({
	["<leader>j"] = {
		name = "+hop/jump",
		w = { "<cmd>HopWord<cr>", "Jump to word" },
		l = { "<cmd>HopLineStart<cr>", "Jump to line" },
		C = { "<cmd>HopChar1<cr>", "Jump to 1 character" },
		c = { "<cmd>HopChar2<cr>", "Jump to 2 Characters" },
		p = { "<cmd>HopPattern<cr>", "Jump to pattern" },
	},
}, { mode = "n" })

wk.register({
	["<leader>b"] = {
		name = "+buffer",
		f = {
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			"Current buffer fuzzy find",
		},
		t = { "<cmd>Telescope current_buffer_tags<cr>", "Current buffer tags" },
	},
})

wk.register({
	["<leader>p"] = {
		name = "+pane",
		j = { "<cmd>:split<cr>", "Split window down" },
		l = { "<cmd>:vsplit<cr>", "Split window right" },
		o = { "<cmd>:only<cr>", "Only window" },
		c = { "<cmd>:close<cr>", "Close window" },
	},
})

wk.register({
	["<leader>g"] = {
		name = "+git",
		m = { "<cmd>Neogit<cr>", "Neogit menu" },
		M = { "<cmd>lua _lazygit_toggle()<cr>", "Lazygit menu" },
		b = { "<cmd>Telescope git_branches<cr>", "Git branches" },
		s = { "<cmd>Telescope git_status<cr>", "Git status" },
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
		D = { "<cmd>lua vim.diagnostic.hide()<cr>", "Hide diagnostics" },
		h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover information" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		f = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "Format file" },
		t = { "<cmd>TroubleToggle document_diagnostics<cr>", "Toggle trouble diagnostics" },
		o = { "<cmd>AerialToggle left<cr>", "Code outline" },
	},
})

wk.register({
	["<leader>s"] = {
		name = "+settings",
		c = { "<cmd>Telescope colorscheme<cr>", "Change colorscheme" },
		k = {
			"<cmd>e ~/.config/nvim/lua/key_bindings.lua<cr>",
			"Open Key bindings",
		},
		K = {
			"<cmd>e ~/.config/kitty/kitty.conf<cr>",
			"Open Kitty Configuration",
		},
		f = { "<cmd>e ~/.config/fish/config.fish<cr>", "Open Fish Configuration" },
		n = {
			"<cmd>e ~/Library/Application Support/nushell/config.nu<cr>",
			"Open Nu Shell Configuration",
		},
		p = { "<cmd>e ~/.config/nvim/lua/plugins.lua<cr>", "Open Plugins" },
		l = { "<cmd>e ~/.config/nvim/lua/lsp_config.lua<cr>", "Open LSP Config" },
		v = {
			"<cmd>e ~/.config/nvim/lua/vim_settings.lua<cr>",
			"Open Vim Settings",
		},
		h = { "<cmd>HardTimeToggle<cr>", "HARDMODE!!!!" },
	},
})

wk.register({
	["<leader>o"] = {
		name = "+organize yourself",
		n = { "<cmd>ObsidianNew<cr>", "Create Scratch note" },
		t = { "<cmd>ObsidianToday<cr>", "Open Today's notes" },
		o = { "<cmd>ObsidianOpen<cr>", "Open file" },
		m = { "<cmd>ObsidianTomorrow<cr>", "Open Tomorrow's notes" },
		y = { "<cmd>ObsidianYesterday<cr>", "Open Yesterday's notes" },
		s = { "<cmd>ObsidianSearch<cr>", "Search notes" },
	},
})

wk.register({
	["<leader>t"] = {
		name = "+test",
		a = {
			'<cmd>lua require("neotest").run.attach()<cr>',
			"Neotest nearest test",
		},
		o = {
			'<cmd>lua require("neotest").output.open({ enter = true })<cr>',
			"Neotest output",
		},
		n = { "<cmd>TestNearest<cr>", "Test nearest file" },
		N = {
			'<cmd>lua require("neotest").run.run()<cr>',
			"Neotest nearest test",
		},
		c = { "<cmd>TestFile<cr>", "Test current file" },
		C = {
			'<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>',
			"Neotest current file",
		},
		s = {
			'<cmd>lua require("neotest").summary.toggle()<cr>',
			"Neotest Summary",
		},
		S = { "<cmd>TestSuite<cr>", "Test suite" },
		v = { "<cmd>TestVisit<cr>", "Visit last test file" },
		l = { "<cmd>TestLast<cr>", "Run most recent test" },
		L = {
			'<cmd>lua require("neotest").run.run_last()<cr>',
			"Neotest run last test",
		},
	},
})

wk.register({
	["<leader>w"] = {
		name = "+words",
		d = { "<Plug>Dsurround", "Delete Surrounding" },
		c = { "<Plug>Csurround", "Change Surrounding" },
		s = { "<Plug>Ysurround", "You Surround" },
		t = {
			"<Plug>(abolish-coerce-word)",
			"(s)nake(m)ix(u)PPER(-)(.)<space>(t)itle",
		},

		u = {
			"<Plug>(abolish-coerce-word) u",
			"(s)nake(m)ix(u)PPER(-)(.)<space>(t)itle",
		},
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
	["<leader>w"] = { name = "+words", s = { "<Plug>VSurround", "You Surround" } },
}, { mode = "v" })

wk.register({ ["<leader>t"] = { name = "+test" } }, { mode = "v" })

--
-- SMART SPLITS
--
-- resizing splits
-- amount defaults to 3 if not specified
-- use absolute values, no + or -
require("smart-splits").resize_up()
require("smart-splits").resize_down()
require("smart-splits").resize_left()
require("smart-splits").resize_right()
-- moving between splits
-- pass same_row as a boolean to override the default
-- for the move_cursor_same_row config option.
-- See Configuration.
--
require("smart-splits").move_cursor_up()
require("smart-splits").move_cursor_down()
require("smart-splits").move_cursor_left()
require("smart-splits").move_cursor_right()
-- persistent resize mode
-- temporarily remap 'h', 'j', 'k', and 'l' to
-- smart resize left, down, up, and right, respectively,
-- press <ESC> to stop resize mode (unless you've set a different key in config)
-- require('smart-splits').start_resize_mode()

-- recommended mappings
-- resizing splits
-- Option
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
-- Control
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)

--
-- YANKY
-- Warning: Pasting slowed down some bit
--
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")
