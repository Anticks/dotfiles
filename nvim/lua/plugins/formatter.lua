return {
  "stevearc/conform.nvim",
  opts = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        rust = { "leptosfmt" },
        -- rust = { "fmt, leptosfmt" },
        gleam = { "gleam" },
        go = { "gofmt", "goimports" },
        elixir = { "mix" },
        markdown = { "prettier" },
        json = { "prettier" },
        toml = { "prettier" },
        sql = { "sqlfmt" },
        hcl = { "hclfmt" },
        sh = { "shfmt" },
        swift = { "swiftformat" }
      },
      formatters = {
        sqlfmt = {
          command = "sqlfmt",
          args = { "-" },
        },
      },
    })
  end,
}
