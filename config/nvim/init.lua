-- :help lazy.nvim
vim.g.maplocalleader = '\\'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key
vim.g.mapleader = ","

-- Load configuration modules
require("settings")
require("interface")
require("functions")
require("keybinds")
require("autocmds")

-- Load lazy plugins
require("lazy").setup("plugins")

-- Load LSP
require("lsp")

-- Load matchit macro
vim.cmd([[runtime macros/matchit.vim]])

-- Load colorscheme after plugins are loaded
vim.cmd.colorscheme('gruvbox')
