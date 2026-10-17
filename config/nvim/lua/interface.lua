-- Interface settings

-- Don't try to highlight lines longer than 800 characters.
vim.opt.synmaxcol = 800

-- Set window width
vim.opt.winwidth = 80

-- Set 7 lines to the cursor - when moving vertically using j/k
vim.opt.scrolloff = 7

-- Set list characters
vim.opt.list = true
vim.opt.listchars = {
  tab = '|┬',
  trail = '•',
  extends = '→',
  precedes = '←',
  nbsp = '‗',
  eol = '¬'
}

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.gdefault = true -- assume the /g flag on :s substitutions to replace all matches in a line

vim.opt.background = 'dark'
