-- Auto installs Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

----- Start loading ----------

require("vim_settings")
require("lazy").setup("plugins")
require("obsidian")
require("key_bindings")
require("plugins")
require("colorscheme")
require("lsp_config")
