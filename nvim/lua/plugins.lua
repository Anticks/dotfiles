vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	use("9mm/vim-closer")

	use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })

	use("EdenEast/nightfox.nvim")

	use({ "andymass/vim-matchup", event = "VimEnter" })

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

	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	})

	use("neovim/nvim-lspconfig")

	use("hrsh7th/cmp-nvim-lsp")

	use("hrsh7th/cmp-buffer")

	use("hrsh7th/cmp-path")

	use("hrsh7th/cmp-cmdline")

	use("hrsh7th/nvim-cmp")

	use("sbdchd/neoformat")

	use("onsails/lspkind-nvim")

	use("ray-x/lsp_signature.nvim")

	use("hrsh7th/cmp-vsnip")

	use("hrsh7th/vim-vsnip")

	use("simrat39/rust-tools.nvim")

	use("hrsh7th/cmp-calc")

	use("f3fora/cmp-spell")

	use("hrsh7th/cmp-emoji")

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

	use("b3nj5m1n/kommentary")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
end)
