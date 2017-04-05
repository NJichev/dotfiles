set runtimepath+=/home/njichev/.vim/bundle/repos/github.com/Shougo/dein.vim
set runtimepath+=~/.vim/

runtime plugins.vim
runtime config/functions.vim
runtime config/keybinds.vim
runtime config/interface.vim
runtime config/settings.vim
runtime config/plugins/denite.vim
runtime config/plugins/deoplete.vim
runtime config/plugins/gutentags.vim
runtime config/plugins/ultisnips.vim

" Nerdcommenter
let NERDSpaceDelims=1

" Neomake
let g:neomake_ruby_enabled_makers = ['rubocop']

" Open files with last place of cursour.

if has("autocmd")
  autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
  autocmd BufReadPost .exs setf elixir

  " Open vim from where it last was
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
endif

" Open pictures and other stuff with other programms
augroup nonvim
  au BufRead *.png,*.jpg,*.pdf,*.gif,*.xls*,*.scpt sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!
augroup END
