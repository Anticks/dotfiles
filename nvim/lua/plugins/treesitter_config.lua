local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

-- ORG MODE
require('orgmode').setup_ts_grammar()

parser_configs.org = {
	install_info = {
		url = "https://github.com/milisims/tree-sitter-org",
		revision = "main",
		files = { "src/parser.c", "src/scanner.cc" },
	},
	filetype = "org",
}

require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	ignore_install = { "haskell", "phpdoc" },
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "org" },
		additional_vim_regex_highlighting = { "org" },
	},
  indent = {
          enable = true,
  },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gi",
			node_incremental = "gs",
			scope_incremental = "gS",
			node_decremental = "gt",
		},
	},
	refactor = {
		highlight_definitions = { enable = true },
		highlight_current_scope = { enable = true },
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
				goto_next_usage = "<a-*>",
				goto_previous_usage = "<a-#>",
			},
		},
	},
	smart_rename = {
		enable = true,
		keymaps = {
			smart_rename = "grr",
		},
	},
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["at"] = "@class.outer",
				["it"] = "@class.inner",
				["ac"] = "@conditional.outer",
				["ic"] = "@conditional.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
				["ak"] = "@call.outer",
				["ik"] = "@call.inner",
				["as"] = "@statement.outer",
				["is"] = "@statement.inner",

				-- Or you can define your own textobjects like this
				["iF"] = {
					python = "(function_definition) @function",
					cpp = "(function_definition) @function",
					c = "(function_definition) @function",
					java = "(method_declaration) @function",
				},
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["gz"] = "@parameter.inner",
			},
			swap_previous = {
				["gZ"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			goto_next_start = {
				["??fr"] = "@function.outer",
				["??tr"] = "@class.outer",
				["??cr"] = "@conditional.outer",
				["??lr"] = "@loop.outer",
				["??br"] = "@block.outer",
				["??kr"] = "@call.outer",
				["??sr"] = "@statement.outer",
			},
			goto_next_end = {
				["??fe"] = "@function.outer",
				["??te"] = "@class.outer",
				["??ce"] = "@conditional.outer",
				["??le"] = "@loop.outer",
				["??be"] = "@block.outer",
				["??ke"] = "@call.outer",
				["??se"] = "@statement.outer",
			},
			goto_previous_start = {
				["??fc"] = "@function.outer",
				["??tc"] = "@class.outer",
				["??cc"] = "@conditional.outer",
				["??lc"] = "@loop.outer",
				["??bc"] = "@block.outer",
				["??kc"] = "@call.outer",
				["??sc"] = "@statement.outer",
			},
		},
	},
})
