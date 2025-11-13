-- More like default settings.
-- Set ctags lookup
vim.opt.tags = '.tags,.git/tags'

-- Use the backspace key as expected
vim.opt.backspace = '2'

-- Copy/paste from the clipboard
vim.opt.clipboard:append('unnamedplus')

-- Remove backups and swapfiles
vim.opt.backup = false
vim.opt.swapfile = false

-- Tabs and spaces
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 2  -- operation >> indents 2 columns; << unindents 2 columns
vim.opt.tabstop = 2     -- a hard TAB displays as 2 columns
vim.opt.shiftround = true    -- round indent to multiple of 'shiftwidth'
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlight search results
vim.opt.hlsearch = true

-- Makes search act like search in modern browsers
vim.opt.incsearch = true

-- Auto save and restore folds
vim.opt.viewoptions:remove('options')

-- Better completion on command line
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:full'
vim.opt.completeopt = { 'menu', 'menuone', 'longest', 'noselect' }

-- Some options
vim.opt.history = 500   -- keep 500 lines of command line history
vim.opt.ruler = true    -- show the cursor position all the time

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Statusline
vim.opt.statusline = '%<%f [%{&ft}] %-4(%m%)%=%-19(%3l,%02c%03V%)'

-- Test-vim
vim.g.neoterm_default_mod = 'botright'
vim.g['test#strategy'] = 'neoterm'

-- Elixir umbrella transformation for test-vim
vim.g['test#custom_transformations'] = {
  elixir_umbrella = function(cmd)
    if string.match(cmd, 'apps/') then
      return cmd:gsub('mix test apps/([^/]*)/', 'mix cmd --app %1 mix test --color ')
    else
      return cmd
    end
  end
}
vim.g['test#transformation'] = 'elixir_umbrella'

-- Python test runner
vim.g['test#python#runner'] = 'pytest'

-- Auto Pairs
vim.g.AutoPairs = { ['('] = ')', ['['] = ']', ['{'] = '}', ["'"] = "'", ['"'] = '"', ['`'] = '`' }

-- Incremental command preview
vim.opt.inccommand = 'split'

-- Ruby indent style
vim.g.ruby_indent_assignment_style = 'variable'

