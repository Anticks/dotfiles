vim.opt.completeopt = {"menuone", "noinsert", "noselect"}
vim.g.kommentary_create_default_mappings = false
vim.g.surround_no_mappings = true
vim.g.mapleader = " "
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.joinspaces = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.sidescrolloff = 8
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.clipboard = "unnamed"
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.guifont = { "MonoLisa Nerd Font", "h12" }
vim.opt.wildmode = {"list", "longest"}
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = "tab:▸\\ ,trail:·"
vim.opt.expandtab = true
vim.api.nvim_exec([[
    augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
  ]], false)
vim.lsp.set_log_level('debug')
vim.api.nvim_command('let test#strategy = "neovim"')
vim.api.nvim_command('let test#neovim#start_normal = 1')
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })
