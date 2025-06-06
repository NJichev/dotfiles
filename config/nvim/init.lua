-- :help lazy.nvim
vim.g.maplocalleader = '\\'
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

vim.g.mapleader = ","
require("keybinds")
require("lazy").setup("plugins")
require("lsp")
require("autocmds")


vim.cmd([[
runtime config/functions.vim
runtime config/keybinds.vim
runtime config/interface.vim
runtime config/settings.vim
runtime macros/matchit.vim

" Open files with last place of cursor.
if has("autocmd")
  autocmd Filetype c setlocal ts=8 sw=8 noexpandtab
  autocmd Filetype elixir setlocal formatprg=mix\ format\ -
  autocmd BufReadPost .pl setf prolog

  au BufRead,BufNewFile *.md setlocal textwidth=72


  " Enable autocompletion for every buffer
  " au BufEnter ?* call ncm2#enable_for_buffer()
  " autocmd! BufWritePost * Neomake
  " autocmd! BufReadPost * Neomake
  " Open vim from where it last was
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif

" Open pictures and other stuff with other programms
augroup nonvim
  au BufRead *.png,*.jpg,*.pdf,*.gif,*.xls*,*.scpt sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!
augroup END
autocmd Filetype gitcommit setlocal spell textwidth=72
augroup filetypedetect
  au! BufRead,BufNewFile *.pl setfiletype prolog
augroup END
]])

