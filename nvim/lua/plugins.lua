return {
  --
  -- Color Scheme
  --
  "EdenEast/nightfox.nvim",
  "marko-cerovac/material.nvim",
  { "catppuccin/nvim",       name = "catppuccin" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
  },
  --
  -- LSP and Auto Completion
  --
  "jose-elias-alvarez/null-ls.nvim",
  "williamboman/mason.nvim",
  {
    "neovim/nvim-lspconfig",
    init_options = {
      userLanguages = {
        eelixir = "html-eex",
        eruby = "erb",
        rust = "html",
      },
    },
  },
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
  "nvim-neotest/nvim-nio",
  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-tree.lua",         -- (optional) to manage project files
      "stevearc/oil.nvim",               -- (optional) to manage project files
      "nvim-treesitter/nvim-treesitter", -- (optional) for Quick tests support (required Swift parser)
    },
    config = function()
      require("xcodebuild").setup({
        -- put some options here or leave it empty to use default settings
      })
    end,
  },
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
        plugins = {
          spelling = {
            enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
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
  { "echasnovski/mini.nvim", version = false },
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
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "rayliwell/tree-sitter-rstml",
    dependencies = { "nvim-treesitter" },
    build = ":TSUpdate"
  },
  -- Automatic tag closing and renaming (optional but highly recommended)
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig",         -- optional
    },
    opts = {},                         -- your configuration
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
  {
    "chrishrb/gx.nvim",
    event = { "BufEnter" },
    dependencies = { "nvim-lua/plenary.nvim" },

    -- you can specify also another config if you want
    config = function()
      require("gx").setup({
        open_browser_app = "open",              -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
        open_browser_args = { "--background" }, -- specify any arguments, such as --background for macOS' "open".
        handlers = {
          plugin = true,                        -- open plugin links in lua (e.g. packer, lazy, ..)
          github = true,                        -- open github issues
          brewfile = true,                      -- open Homebrew formulaes and casks
          package_json = true,                  -- open dependencies from package.json
          search = true,                        -- search the web/selection on the web if nothing else is found
        },
        handler_options = {
          search_engine = "google", -- you can select between google, bing, duckduckgo, and ecosia
        },
      })
    end,
  },
}
