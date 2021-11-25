local function packer_init()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if fn.empty(fn.glob(install_path)) > 0 then
		packer_bootstrap = fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
	end

	vim.cmd([[packadd! packer.nvim]])
	vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")
end

----- Start loading ----------

packer_init()

require("plugins")
require("colorscheme")
require("keybindings")
require("common")
-- require("lsp")
require("cmpconfig")
