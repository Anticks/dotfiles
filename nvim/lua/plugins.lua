vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    --
    -- Color Scheme
    --
    use("EdenEast/nightfox.nvim")

    use("marko-cerovac/material.nvim")

    --
    -- LSP and Auto Completion
    --
    use("jose-elias-alvarez/null-ls.nvim")

    use("jose-elias-alvarez/nvim-lsp-ts-utils")

    use("neovim/nvim-lspconfig")

    use("github/copilot.vim")

    use("hrsh7th/cmp-nvim-lsp")

    use("hrsh7th/cmp-buffer")

    use("hrsh7th/cmp-path")

    use("hrsh7th/cmp-cmdline")

    use("hrsh7th/nvim-cmp")

    use("sbdchd/neoformat")

    use("onsails/lspkind-nvim")

    use("ray-x/lsp_signature.nvim")

    use("SirVer/ultisnips")

    use("quangnguyen30192/cmp-nvim-ultisnips")

    use("simrat39/rust-tools.nvim")

    use("hrsh7th/cmp-calc")

    use("f3fora/cmp-spell")

    use("hrsh7th/cmp-emoji")

    use("octaltree/cmp-look")

    use("williamboman/nvim-lsp-installer")

    --
    -- Key Binding
    --
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
                    margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
                    padding = {2, 2, 2, 2}, -- extra window padding [top, right, bottom, left]
                    winblend = 0
                }
            })
        end
    })

    --
    -- Productivity
    --
    use("rstacruz/vim-closer")

    use("b3nj5m1n/kommentary")

    use("tpope/vim-surround")

    use("vim-test/vim-test")

    use({
        "rcarriga/vim-ultest",
        requires = {"vim-test/vim-test"},
        run = ":UpdateRemotePlugins"
    })

    use("rcarriga/nvim-notify")

    use("elixir-editors/vim-elixir")

    use({
        "akinsho/toggleterm.nvim",
        config = function() require("plugins.toggle_terminal_config") end
    })

    use({
        "tpope/vim-dispatch",
        opt = true,
        cmd = {"Dispatch", "Make", "Focus", "Start"}
    })

    use({"andymass/vim-matchup", event = "VimEnter"})

    use({"ThePrimeagen/harpoon", requires = "nvim-lua/plenary.nvim"})

    use({
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons", opt = true}
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function() require("plugins.treesitter_config") end
    })

    use({
        "TimUntersberger/neogit",
        requires = "nvim-lua/plenary.nvim",
        config = function() require("neogit").setup({}) end
    })

    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end
    })

    use({
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/plenary.nvim"}}
    })

    use({
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require("plugins.nvim_tree_config") end
    })

    use({"stevearc/dressing.nvim"})

    use("yamatsum/nvim-nonicons")

    use({
        "phaazon/hop.nvim",
        branch = "v1", -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require("hop").setup({keys = "etovxqpdygfblzhckisuran"})
        end
    })

    use({
        "goolord/alpha-nvim",
        requires = {"kyazdani42/nvim-web-devicons"},
        config = function()
            require("alpha").setup(require("alpha.themes.startify").opts)
        end
    })

    use({
        "lewis6991/gitsigns.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = function() require("plugins.git_signs_config") end
    })

    use({
        "glacambre/firenvim",
        run = function() vim.fn["firenvim#install"](0) end
    })

    use({
        "nvim-orgmode/orgmode",
        config = function()
            require("orgmode").setup({
                org_agenda_files = {"~/.config/my-orgs/**/*"},
                org_default_notes_file = "~/.config/my-orgs/refile.org"
            })
        end
    })

    use({
        "akinsho/org-bullets.nvim",
        config = function()
            require("org-bullets").setup({
                symbols = {"◉", "○", "✸", "✿"}
            })
        end
    })
end)
