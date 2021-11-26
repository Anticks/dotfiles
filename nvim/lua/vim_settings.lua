vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.g.kommentary_create_default_mappings = false
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.joinspaces = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.sidescrolloff = 8
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.wildmode = { "list", "longest" }
vim.opt.wrap = false
vim.opt.guifont = "JetBrainsMono Nerd Font:h12"
vim.opt.list = true
vim.opt.listchars = "tab:▸\\ ,trail:·"
vim.api.nvim_exec(
	[[
    augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
  ]],
	false
)
