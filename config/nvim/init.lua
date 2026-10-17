vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

require("settings")
require("interface")
require("functions")
require("keybinds")
require("autocmds")

-- Plugins are managed by the built-in vim.pack (:h vim.pack).
-- Versions are pinned in nvim-pack-lock.json; update with :lua vim.pack.update()
require("plugins")

require("lsp")
