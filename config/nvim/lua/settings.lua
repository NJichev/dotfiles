-- Set ctags lookup
vim.opt.tags = '.tags,.git/tags'

-- Copy/paste from the clipboard
vim.opt.clipboard:append('unnamedplus')

-- Remove backups and swapfiles
vim.opt.backup = false
vim.opt.swapfile = false

-- Tabs and spaces
vim.opt.smartindent = true
vim.opt.shiftwidth = 2  -- operation >> indents 2 columns; << unindents 2 columns
vim.opt.tabstop = 2     -- a hard TAB displays as 2 columns
vim.opt.shiftround = true    -- round indent to multiple of 'shiftwidth'
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Auto save and restore folds
vim.opt.viewoptions:remove('options')

-- Better completion on command line
vim.opt.wildmode = 'list:full'
vim.opt.completeopt = { 'menu', 'menuone', 'longest', 'noselect' }

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Statusline
vim.opt.statusline = '%<%f [%{&ft}] %-4(%m%)%=%-19(%3l,%02c%03V%)'

-- Rounded borders on all floating windows (hover, signature help, diagnostics)
vim.opt.winborder = 'rounded'

-- Incremental command preview
vim.opt.inccommand = 'split'

-- Ruby indent style
vim.g.ruby_indent_assignment_style = 'variable'
