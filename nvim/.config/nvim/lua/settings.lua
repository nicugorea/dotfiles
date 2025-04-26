vim.opt.termguicolors = true

-- Tab & Indentation
vim.opt.tabstop = 4 -- 1 tab = 4 spaces
vim.opt.shiftwidth = 4 -- Auto-indent uses 4 spaces
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Wrap
vim.opt.wrap = false

-- Line numbers
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers

-- LSP
vim.opt.signcolumn = "yes" -- Required for LSP diagnostics

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Status bar
vim.opt.showmode = false -- Hide default mode text (since lualine shows it)

-- Search
vim.opt.incsearch = true
vim.opt.ignorecase = true

-- Transparent background
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])

-- Clipboard
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Save undo history
vim.opt.undofile = true
