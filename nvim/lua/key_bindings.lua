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

wk.add({
  { "<leader>.", "<cmd>Format<cr>", desc = "Format file" },
})
wk.add({
  { "<leader>i", "<cmd>set nolist<cr>", desc = "Remove indents" },
})

wk.add({
  { "<leader>/", "<Plug>kommentary_line_default", desc = "Komment line(s)" },
})

wk.add({
  { "<leader>f",  group = "file" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Find files" },
  { "<leader>fl", "<cmd>Telescope live_grep<cr>",   desc = "Live grep" },
  { "<leader>fn", "<cmd>enew<cr>",                  desc = "New file" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>",    desc = "Open recent file" },
  { "<leader>ft", "<cmd>NvimTreeToggle<cr>",        desc = "Toggle NvimTree" },
  { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Find word" },
})

wk.add({
  { "<leader>x",  group = "xcode" },
  { "<leader>xB", "<cmd>XcodebuildBuildForTesting<cr>", desc = "Build For Testing" },
  { "<leader>xR", "<cmd>XcodebuildTestRepeat<cr>",      desc = "Repeat Last Test Run" },
  { "<leader>xT", "<cmd>XcodebuildTestClass<cr>",       desc = "Run Current Test Class" },
  { "<leader>xb", "<cmd>XcodebuildBuild<cr>",           desc = "Build Project" },
  { "<leader>xf", "<cmd>XcodebuildProjectManager<cr>",  desc = "Show Project Manager Actions" },
  { "<leader>xr", "<cmd>XcodebuildBuildRun<cr>",        desc = "Build & Run Project" },
  { "<leader>xs", "<cmd>XcodebuildTestSelected<cr>",    desc = "Run Selected Tests" },
  { "<leader>xt", "<cmd>XcodebuildTest<cr>",            desc = "Run Tests" },
  { "<leader>xx", "<cmd>XcodebuildPicker<cr>",          desc = "Show Xcodebuild Actions" },
})

wk.add({
  { "<leader>j",  group = "hop/jump" },
  { "<leader>jC", "<cmd>HopChar1<cr>",     desc = "Jump to 1 character" },
  { "<leader>jc", "<cmd>HopChar2<cr>",     desc = "Jump to 2 Characters" },
  { "<leader>jl", "<cmd>HopLineStart<cr>", desc = "Jump to line" },
  { "<leader>jp", "<cmd>HopPattern<cr>",   desc = "Jump to pattern" },
  { "<leader>jw", "<cmd>HopWord<cr>",      desc = "Jump to word" },
}, { mode = "n" })

wk.add({
  { "<leader>b",  group = "buffer" },
  { "<leader>bf", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current buffer fuzzy find" },
  { "<leader>bt", "<cmd>Telescope current_buffer_tags<cr>",       desc = "Current buffer tags" },
})

wk.add({
  { "<leader>p",  group = "pane" },
  { "<leader>pc", "<cmd>:close<cr>",  desc = "Close window" },
  { "<leader>pj", "<cmd>:split<cr>",  desc = "Split window down" },
  { "<leader>pl", "<cmd>:vsplit<cr>", desc = "Split window right" },
  { "<leader>po", "<cmd>:only<cr>",   desc = "Only window" },
})

wk.add({
  { "<leader>g",  group = "git" },
  { "<leader>gB", "<cmd>Gitsigns stage_buffer<cr>",              desc = "Stage buffer" },
  { "<leader>gL", "<cmd>Gitsigns blame_line<cr>",                desc = "Blame line detail" },
  { "<leader>gM", "<cmd>lua _lazygit_toggle()<cr>",              desc = "Lazygit menu" },
  { "<leader>gP", "<cmd>Gitsigns preview_hunk<cr>",              desc = "Preview hunk" },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>",             desc = "Git branches" },
  { "<leader>gh", "<cmd>Gitsigns stage_hunk<cr>",                desc = "Stage hunk" },
  { "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle blame line" },
  { "<leader>gm", "<cmd>Neogit<cr>",                             desc = "Neogit menu" },
  { "<leader>gn", "<cmd>Gitsigns next_hunk<cr>",                 desc = "Next hunk" },
  { "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>",                 desc = "Previous hunk" },
  { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",                desc = "Reset hunk" },
  { "<leader>gs", "<cmd>Telescope git_status<cr>",               desc = "Git status" },
})

wk.add({
  { "<leader>c",  group = "code/lsp" },
  { "<leader>cD", "<cmd>lua vim.diagnostic.hide()<cr>",               desc = "Hide diagnostics" },
  { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>",           desc = "Code action" },
  { "<leader>cd", "<cmd>lua vim.lsp.buf.definition()<cr>",            desc = "Go to definition" },
  { "<leader>cf", "<cmd>lua vim.lsp.buf.format { async = true }<cr>", desc = "Format file" },
  { "<leader>ch", "<cmd>lua vim.lsp.buf.hover()<cr>",                 desc = "Hover information" },
  { "<leader>co", "<cmd>AerialToggle left<cr>",                       desc = "Code outline" },
  { "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>",                desc = "Rename" },
  { "<leader>ct", "<cmd>Trouble diagnostics<cr>",                     desc = "Toggle trouble diagnostics" },
})

wk.add({
  { "<leader>s",  group = "settings" },
  { "<leader>sK", "<cmd>e ~/.config/kitty/kitty.conf<cr>",                      desc = "Open Kitty Config" },
  { "<leader>sc", "<cmd>Telescope colorscheme<cr>",                             desc = "Change colorscheme" },
  { "<leader>sf", "<cmd>e ~/.config/fish/config.fish<cr>",                      desc = "Open Fish Config" },
  { "<leader>sh", "<cmd>HardTimeToggle<cr>",                                    desc = "HARDMODE!!!!" },
  { "<leader>sk", "<cmd>e ~/.config/nvim/lua/key_bindings.lua<cr>",             desc = "Open Key bindings" },
  { "<leader>sl", "<cmd>e ~/.config/nvim/lua/lsp_config.lua<cr>",               desc = "Open LSP Config" },
  { "<leader>sn", "<cmd>e ~/Library/Application Support/nushell/config.nu<cr>", desc = "Open Nu Shell Config" },
  { "<leader>sp", "<cmd>e ~/.config/nvim/lua/plugins.lua<cr>",                  desc = "Open Plugins" },
  { "<leader>sv", "<cmd>e ~/.config/nvim/lua/vim_settings.lua<cr>",             desc = "Open Vim Settings" },
})

wk.add({
  { "<leader>o",  group = "organize yourself" },
  { "<leader>om", "<cmd>ObsidianTomorrow<cr>",  desc = "Open Tomorrow's notes" },
  { "<leader>on", "<cmd>ObsidianNew<cr>",       desc = "Create Scratch note" },
  { "<leader>oo", "<cmd>ObsidianOpen<cr>",      desc = "Open file" },
  { "<leader>os", "<cmd>ObsidianSearch<cr>",    desc = "Search notes" },
  { "<leader>ot", "<cmd>ObsidianToday<cr>",     desc = "Open Today's notes" },
  { "<leader>oy", "<cmd>ObsidianYesterday<cr>", desc = "Open Yesterday's notes" },
})

wk.add({
  { "<leader>t",  group = "test" },
  { "<leader>tC", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>',   desc = "Neotest current file" },
  { "<leader>tL", '<cmd>lua require("neotest").run.run_last()<cr>',                desc = "Neotest run last test" },
  { "<leader>tN", '<cmd>lua require("neotest").run.run()<cr>',                     desc = "Neotest nearest test" },
  { "<leader>tS", "<cmd>TestSuite<cr>",                                            desc = "Test suite" },
  { "<leader>ta", '<cmd>lua require("neotest").run.attach()<cr>',                  desc = "Neotest nearest test" },
  { "<leader>tc", "<cmd>TestFile<cr>",                                             desc = "Test current file" },
  { "<leader>tl", "<cmd>TestLast<cr>",                                             desc = "Run most recent test" },
  { "<leader>tn", "<cmd>TestNearest<cr>",                                          desc = "Test nearest file" },
  { "<leader>to", '<cmd>lua require("neotest").output.open({ enter = true })<cr>', desc = "Neotest output" },
  { "<leader>ts", '<cmd>lua require("neotest").summary.toggle()<cr>',              desc = "Neotest Summary" },
  { "<leader>tv", "<cmd>TestVisit<cr>",                                            desc = "Visit last test file" },
})

wk.add({
  { "<leader>w",  group = "words" },
  { "<leader>wc", "<Plug>Csurround",               desc = "Change Surrounding" },
  { "<leader>wd", "<Plug>Dsurround",               desc = "Delete Surrounding" },
  { "<leader>ws", "<Plug>Ysurround",               desc = "You Surround" },
  { "<leader>wt", "<Plug>(abolish-coerce-word)",   desc = "(s)nake(m)ix(u)PPER(-)(.)<space>(t)itle" },
  { "<leader>wu", "<Plug>(abolish-coerce-word) u", desc = "(s)nake(m)ix(u)PPER(-)(.)<space>(t)itle" },
})

--
-- VISUAL MODE BINDINGS
--
wk.add({
  { "<leader>/", "<Plug>kommentary_visual_default", desc = "Komment Line(s)", mode = "v" },
}, { mode = "v" })

wk.add({
  {
    mode = { "v" },
    { "<leader>j",  group = "hop/jump" },
    { "<leader>jC", "<cmd>HopChar2<cr>",     desc = "2 Characters" },
    { "<leader>jc", "<cmd>HopChar1<cr>",     desc = "1 Character" },
    { "<leader>jl", "<cmd>HopLineStart<cr>", desc = "Line" },
    { "<leader>jp", "<cmd>HopPattern<cr>",   desc = "Search for Pattern" },
    { "<leader>jw", "<cmd>HopWord<cr>",      desc = "Word" },
  },
}, { mode = "v" })

wk.add({
  { "<leader>w",  group = "words",   mode = "v" },
  { "<leader>ws", "<Plug>VSurround", desc = "You Surround", mode = "v" },
}, { mode = "v" })

wk.add({
  { "<leader>t", group = "test", mode = "v" },
}, { mode = "v" })

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
