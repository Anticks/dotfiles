-- Setup nvim-cmp.
local cmp = require("cmp")
local null_ls = require("null-ls")
local lsp = require("lspconfig")
local lspkind = require("lspkind")
local capabilities = require("cmp_nvim_lsp")
local rust_tools = require("rust-tools")
local lsp_signature = require("lsp_signature")
local path_to_ltexls_en = vim.fn.expand("~/.config/ltex-ls/en")

-- LSP SIGNATURE
lsp_signature.setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = { border = "rounded" },
  floating_window = false,
  hint_prefix = "👺 ",
})

require("mason").setup()
require("mason-lspconfig").setup()

local function on_attach(client, bufnr)
  -- set up buffer keymaps, etc.
end

-- SVELTE
lsp.svelte.setup({ on_attach = on_attach })

-- TAILWIND

-- BASH
lsp.bashls.setup({})

-- CMP
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
    end, {
      "i",
      "s", --[[ "c" (to enable the mapping in command mode) ]]
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      cmp_ultisnips_mappings.jump_backwards(fallback)
    end, {
      "i",
      "s", --[[ "c" (to enable the mapping in command mode) ]]
    }),
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
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
    { name = "norg" },
    { name = "nvim_lsp" },
    { name = "orgmode" },
    { name = "path" },
    { name = "ultisnips" }, -- For ultisnips users.
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
        emoji = "[Emoji]",
      },
    }),
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", { sources = { { name = "buffer" } } })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
})
capabilities.default_capabilities(vim.lsp.protocol.make_client_capabilities())

--
-- Elixir
--
lsp.elixirls.setup({
  settings = {
    elixirLS = {
      -- I choose to disable dialyzer for personal reasons, but
      -- I would suggest you also disable it unless you are well
      -- aquainted with dialzyer and know how to use it.
      dialyzerEnabled = true,
      -- I also choose to turn off the auto dep fetching feature.
      -- It often get's into a weird state that requires deleting
      -- the .elixir_ls directory and restarting your editor.
      fetchDeps = false,
    },
  },
})

--
-- GO
--
lsp.gopls.setup({})

--
-- GQL
--
lsp.graphql.setup({})

--
-- Tailwind
--
lsp.tailwindcss.setup({})

--
-- Gleam
--
lsp.gleam.setup({})

--
-- JAVASCRIPT
--
lsp.ts_ls.setup({})

--
-- TERRAFORM
--
lsp.terraform_lsp.setup({ cmd = { "terraform-ls" } })

--
-- RUST
--
rust_tools.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

lsp.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      -- Other Settings ...
      procMacro = {
        ignored = {
          leptos_macro = {
            -- optional: --
            "component",
            "server",
          },
        },
      },
      cargo = {
        allFeatures = true, -- Alternatively, enable all features
      },
    },
  },
})

--
-- LTEX
--
lsp.ltex.setup({
  cmd = { "ltex-ls" },
  settings = { additionalRules = { languageModel = { path_to_ltexls_en } } },
  filetypes = {
    "bib",
    "gitcommit",
    "markdown",
    "org",
    "plaintex",
    "rst",
    "rnoweb",
    "tex",
    "norg",
  },
})

--
-- LUA
--
lsp.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        -- path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
})

--
-- Swift
--
lsp.sourcekit.setup({})

--
-- Null LS
--
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.sqlfluff.with({
      extra_args = { "--dialect", "postgres" }, -- change to your dialect
    }),
    null_ls.builtins.diagnostics.credo.with({
      method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      command = "mix",
      lint_command = "credo suggest --format=flycheck --read-from-stdin ${INPUT}",
    }),
    null_ls.builtins.formatting.sqlfmt,
  },
})

--[[ local credo = require("lint").linters.credo
credo.cmd = "mix"
credo.args = { "credo", "suggest", "--format=flycheck", "--read-from-stdin", "${INPUT}" } ]]
