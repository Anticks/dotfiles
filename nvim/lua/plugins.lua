-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- local execute = vim.api.nvim_command
-- local fn = vim.fn
-- local packer_install_dir = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- if fn.empty(fn.glob(packer_install_dir)) > 0 then
--   vim.api.nvim_echo({{'Installing packer.nvim', 'Type'}}, true, {})
--   execute(install_cmd)
--   execute 'packadd packer.nvim'
-- end
-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()
--

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Simple plugins can be specified as strings
	use("9mm/vim-closer")

	-- Lazy loading:
	-- Load on specific commands
	use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })

	use("EdenEast/nightfox.nvim")

	-- Load on an autocommand event
	use({ "andymass/vim-matchup", event = "VimEnter" })

	-- Load on a combination of conditions: specific filetypes or commands
	-- Also run code after load (see the "config" key)
	use({
		"w0rp/ale",
		ft = { "sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "racket", "vim", "tex" },
		cmd = "ALEEnable",
		config = "vim.cmd[[ALEEnable]]",
	})

	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").opts)
		end,
	})

	-- Plugins can have dependencies on other plugins
	use({
		"haorenW1025/completion-nvim",
		opt = true,
		requires = { { "hrsh7th/vim-vsnip", opt = true }, { "hrsh7th/vim-vsnip-integ", opt = true } },
	})

	-- Post-install/update hook with call of vimscript function with argument
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	-- Use specific branch, dependency and run lua file after load

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Use dependency and run lua function after load
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({ "neovim/nvim-lspconfig" })
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	-- use("SirVer/ultisnips")
	use("sbdchd/neoformat")
	use("onsails/lspkind-nvim")
	use("ray-x/lsp_signature.nvim")

	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("simrat39/rust-tools.nvim")
	use("hrsh7th/cmp-calc")
	use("f3fora/cmp-spell")
	use("hrsh7th/cmp-emoji")
	-- Lua
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
				window = {
					border = "double", -- none, single, double, shadow
					position = "bottom", -- bottom, top
					margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
					padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
					winblend = 0,
				},
			})
		end,
	})

	use("tpope/vim-fugitive")

	-- Lua
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-tree").setup({})
		end,
	})

	use({
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	-- comment code
	use("b3nj5m1n/kommentary")
end)
