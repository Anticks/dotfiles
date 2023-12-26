return {
	--
	-- Color Scheme
	--
	"EdenEast/nightfox.nvim",
	"marko-cerovac/material.nvim",
	{ "catppuccin/nvim", name = "catppuccin" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
	},
	--
	-- LSP and Auto Completion
	--
	"jose-elias-alvarez/null-ls.nvim",
	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig",
	"github/copilot.vim",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"sbdchd/neoformat",
	"onsails/lspkind-nvim",
	"ray-x/lsp_signature.nvim",
	"SirVer/ultisnips",
	"williamboman/mason-lspconfig.nvim",
	"quangnguyen30192/cmp-nvim-ultisnips",
	"simrat39/rust-tools.nvim",
	"hrsh7th/cmp-calc",
	"f3fora/cmp-spell",
	"hrsh7th/cmp-emoji",
	"octaltree/cmp-look",
	"fatih/vim-go",
	"nanotee/sqls.nvim",
	--
	-- Key Binding
	--
	{
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
				plugins = {
					spelling = {
						enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
						suggestions = 20, -- how many suggestions should be shown in the list?
					},
				},
			})
		end,
	},
	--
	-- Productivity
	--
	"mrjones2014/smart-splits.nvim",
	"takac/vim-hardtime",
	"rstacruz/vim-closer",
	"b3nj5m1n/kommentary",
	"tpope/vim-surround",
	"tpope/vim-abolish",
	"tpope/vim-eunuch",
	"vim-test/vim-test",
	"rcarriga/nvim-notify",
	"elixir-editors/vim-elixir",
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-vim-test",
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-python",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-go"),
					require("neotest-python"),
					require("neotest-vim-test")({ ignore_filetypes = { "python", "go" } }),
				},
			})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugin_imports.toggle_terminal_config")
		end,
	},
	{
		"tpope/vim-dispatch",
		lazy = true,
		cmd = { "Dispatch", "Make", "Focus", "Start" },
	},
	{ "andymass/vim-matchup", event = "VimEnter" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugin_imports.treesitter_config")
		end,
	},
	{
		"TimUntersberger/neogit",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("neogit").setup({})
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	},
	{
		"goolord/alpha-nvim",
		config = function()
			require("plugin_imports.alpha_nvim_config")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugin_imports.nvim_tree_config")
		end,
	},
	{
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({ input = { insert_only = false } })
		end,
	},
	{
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugin_imports.git_signs_config")
		end,
	},
	{
		"glacambre/firenvim",
		build = function()
			vim.fn["firenvim#install"](0)
		end,
	},
	{
		"gbprod/yanky.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"stevearc/aerial.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"kyazdani42/nvim-web-devicons",
		},
	},
}
