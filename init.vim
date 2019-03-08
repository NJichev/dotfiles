set runtimepath+=~/.vim/
set runtimepath+=~/dotfiles/config/nvim/

runtime plugins.vim
runtime config/functions.vim
runtime config/keybinds.vim
runtime config/interface.vim
runtime config/settings.vim
runtime config/plugins/completion.vim
runtime config/plugins/neoterm.vim
runtime config/plugins/gutentags.vim
runtime config/plugins/ultisnips.vim
runtime macros/matchit.vim

" Nerdcommenter
let NERDSpaceDelims=1

" Open files with last place of cursor.
if has("autocmd")
  autocmd Filetype c setlocal ts=8 sw=8 noexpandtab
  autocmd Filetype ruby set ts=2 sw=2 expandtab omnifunc=rubycomplete#Complete
  autocmd Filetype elixir setlocal formatprg=mix\ format\ -
  autocmd BufReadPost .pl setf prolog

  " Enable autocompletion for every buffer
  " au BufEnter ?* call ncm2#enable_for_buffer()
  " autocmd! BufWritePost * Neomake
  " autocmd! BufReadPost * Neomake
  " Open vim from where it last was
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Fixes alacritty rendering issue
  autocmd BufEnter * highlight Normal guibg=0
endif

" Open pictures and other stuff with other programms
augroup nonvim
  au BufRead *.png,*.jpg,*.pdf,*.gif,*.xls*,*.scpt sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!
augroup END
autocmd Filetype gitcommit setlocal spell textwidth=72
augroup filetypedetect
  au! BufRead,BufNewFile *.pl setfiletype prolog
augroup END
