set runtimepath+=~/.vim/

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/config/functions.vim
source $HOME/.config/nvim/config/keybinds.vim
source $HOME/.config/nvim/config/interface.vim
source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/plugins/deoplete.vim
source $HOME/.config/nvim/config/plugins/gutentags.vim
source $HOME/.config/nvim/config/plugins/ultisnips.vim

" Nerdcommenter
let NERDSpaceDelims=1

" Open files with last place of cursour.

if has("autocmd")
  autocmd Filetype ruby setlocal ts=2 sw=2 expandtab omnifunc=rubycomplete#Complete
  autocmd BufReadPost .exs setf elixir

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
