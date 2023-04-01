-- Setup nvim-cmp.
local cmp = require("cmp")
local null_ls = require("null-ls")
local lsp = require("lspconfig")
local lspkind = require("lspkind")
local capabilities = require("cmp_nvim_lsp")
local rust_tools = require("rust-tools")
local lsp_signature = require("lsp_signature")
local path_to_elixirls = vim.fn.expand("~/.config/elixir-ls/language_server.sh")
local path_to_sumneko_lua = vim.fn.expand(
  "~/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server")
local path_to_ltexls = vim.fn.expand("~/.config/ltex-ls/bin/ltex-ls")
local path_to_ltexls_en = vim.fn.expand("~/.config/ltex-ls/en")
local path_to_gopls = vim.fn.expand("~/.local/share/nvim/lsp_servers/go/gopls")
local path_to_tailwind = vim.fn.expand(
  "~/.local/share/nvim/lsp_servers/tailwindcss_npm/node_modules/@tailwindcss/language-server/bin/tailwindcss-language-server")
-- local path_to_grammarly = vim.fn.expand(
-- "~/.local/share/nvim/lsp_servers/grammarly")

-- LSP SIGNATURE
lsp_signature.setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = { border = "rounded" },
  floating_window = false,
  hint_prefix = "👺 "
})

require("nvim-lsp-installer").setup {}

local function on_attach(client, bufnr)
  -- set up buffer keymaps, etc.
end

lsp.svelte.setup { on_attach = on_attach }
lsp.tailwindcss.setup { on_attach = on_attach }

-- CMP
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<CR>'] = cmp.mapping.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  --[[ mapping = {
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end
    }, ]]
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  --[[ mapping = {
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ["<CR>"] = cmp.mapping.confirm({select = true})
    }, ]]
  sources = cmp.config.sources({
    { name = "norg" }, { name = "nvim_lsp" }, { name = "orgmode" },
    { name = "path" }, { name = "ultisnips" } -- For ultisnips users.
    -- { name = "look", keyword_length = 2, option = { convert_case = true, loud = true } },
    -- { name = "vsnip" }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'snippy' }, -- For snippy users.
  }, { { name = "buffer" } }),
  formatting = {
    format = lspkind.cmp_format({
      with_text = false,
      maxwidth = 50,
      menu = {
        orgmode = "[OrgMode]",
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        nvim_lua = "[Lua]",
        ultisnips = "[UltiSnips]",
        treesitter = "[treesitter]",
        neorg = "[Neorg]",
        look = "[Look]",
        path = "[Path]",
        spell = "[Spell]",
        calc = "[Calc]",
        emoji = "[Emoji]"
      }
    })
  }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", { sources = { { name = "buffer" } } })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } })
})

capabilities.default_capabilities(vim.lsp.protocol.make_client_capabilities())

--
-- Elixir
--
lsp.elixirls.setup({
  cmd = { path_to_elixirls },
  settings = {
    elixirLS = {
      -- I choose to disable dialyzer for personal reasons, but
      -- I would suggest you also disable it unless you are well
      -- aquainted with dialzyer and know how to use it.
      dialyzerEnabled = true,
      -- I also choose to turn off the auto dep fetching feature.
      -- It often get's into a weird state that requires deleting
      -- the .elixir_ls directory and restarting your editor.
      fetchDeps = false
    }
  }
})

--
-- GO
--
lsp.gopls.setup({ cmd = { path_to_gopls } })

lsp.tailwindcss.setup({ cmd = { path_to_tailwind } })

--
-- JAVASCRIPT
--
lsp.tsserver.setup({
  -- Needed for inlayHints. Merge this table with your settings or copy
  -- it from the source if you want to add your own init_options.
  init_options = require("nvim-lsp-ts-utils").init_options,
  --
  on_attach = function(client, bufnr)
    local ts_utils = require("nvim-lsp-ts-utils")

    -- defaults
    ts_utils.setup({
      debug = false,
      disable_commands = false,
      enable_import_on_completion = false,

      -- import all
      import_all_timeout = 5000, -- ms
      -- lower numbers = higher priority
      import_all_priorities = {
        same_file = 1, -- add to existing import statement
        local_files = 2, -- git files or files with relative path markers
        buffer_content = 3, -- loaded buffer content
        buffers = 4 -- loaded buffer names
      },
      import_all_scan_buffers = 100,
      import_all_select_source = false,
      -- if false will avoid organizing imports
      always_organize_imports = true,

      -- filter diagnostics
      filter_out_diagnostics_by_severity = {},
      filter_out_diagnostics_by_code = {},

      -- inlay hints
      auto_inlay_hints = true,
      inlay_hints_highlight = "Comment",
      inlay_hints_priority = 200, -- priority of the hint extmarks
      inlay_hints_throttle = 150, -- throttle the inlay hint request
      inlay_hints_format = { -- format options for individual hint kind
        Type = {},
        Parameter = {},
        Enum = {}
        -- Example format customization for `Type` kind:
        -- Type = {
        --     highlight = "Comment",
        --     text = function(text)
        --         return "->" .. text:sub(2)
        --     end,
        -- },
      },

      -- update imports on file move
      update_imports_on_move = false,
      require_confirmation_on_move = false,
      watch_dir = nil
    })

    -- required to fix code action ranges and filter diagnostics
    ts_utils.setup_client(client)

    -- no default maps, so you may want to define some here
    local opts = { silent = true }
    vim.api
        .nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>",
      opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>",
      opts)
  end
})

--
-- RUST
--

--[[ lsp.rust_analyzer.setup {
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                allFeatures = true,
                overrideCommand = {
                    'cargo', 'clippy', '--workspace', '--message-format=json',
                    '--all-targets', '--all-features'
                }
            }
        }
    }
} ]]

rust_tools.setup({})

--
-- LTEX
--
lsp.ltex.setup({
  cmd = { path_to_ltexls },
  settings = { additionalRules = { languageModel = { path_to_ltexls_en } } },
  filetypes = {
    "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb",
    "tex", "norg"
  }
})

--
-- GRAMMARLY
--
--[[ lsp.grammarly.setup({
    cmd = {path_to_grammarly},
    filetypes = {
        "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb",
        "tex", "norg"
    }
}) ]]

--
-- LUA
--
lsp.lua_ls.setup {
  cmd = { path_to_sumneko_lua },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
        -- Setup your lua path
        -- path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true)
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false }
    }
  }
}
--
-- Swift
--
lsp.sourcekit.setup({})

--
-- Null LS
--
null_ls.setup({
  sources = {
    null_ls.builtins.completion.spell, null_ls.builtins.diagnostics.credo,
    null_ls.builtins.formatting.swiftformat,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.formatting.lua_format,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.credo.with({
      method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      command = "/Users/megaman/.asdf/installs/elixir/1.10-otp-22/.mix/escripts/credo",
      lint_command = "MIX_ENV=test mix credo suggest --format=flycheck --read-from-stdin ${INPUT}"
    })
  }
})
