return {
    'stevearc/conform.nvim',
    opts = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = {"stylua"},
                -- Conform will run multiple formatters sequentially
                python = {"isort", "black"},
                -- Use a sub-list to run only the first available formatter
                javascript = {{"prettierd", "prettier"}},
                rust = {"rustfmt"},
                go = {"gofmt", "goimports"},
                elixir = {"mix"}
            }
        })
    end
}
