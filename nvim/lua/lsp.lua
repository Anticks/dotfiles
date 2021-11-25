local lsp = require "lspconfig"
local coq = require "coq"

vim.lsp.buf.formatting()

-- lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities{})

vim.cmd([[COQnow]])
