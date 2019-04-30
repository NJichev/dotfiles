if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.vim/plugged')
  " Colorschemes
  Plug 'quanganhdo/grb256'
  Plug 'morhetz/gruvbox'

  Plug 'w0rp/ale'

  "Camel Case motions
  Plug 'bkad/CamelCaseMotion'

  " NerdTree
  Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }

  " Tags
  Plug 'ludovicchabant/vim-gutentags', { 'for' : 'ruby' }

  " Syntax for many languages
  Plug 'sheerun/vim-polyglot'

  " Testing for different languages
  Plug 'janko-m/vim-test'
  Plug 'kassio/neoterm'

  " Autopairs
  Plug 'jiangmiao/auto-pairs'

  " Elixir
  Plug 'elixir-editors/vim-elixir'

  " Tpope utility plugins
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-endwise'

  " Other utility plugins
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tomtom/tcomment_vim'

  " Alignment
  Plug 'godlygeek/tabular', { 'on' : 'Tabularize' }

  " Vim fast searching and moving around
  Plug 'dyng/ctrlsf.vim', { 'on' : 'CtrlSF' }

  Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
  Plug 'junegunn/fzf.vim'

  " Vim stuff
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'AndrewRadev/switch.vim'
  Plug 'AndrewRadev/splitjoin.vim'

  Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }

  " Ruby text objects
  Plug 'kana/vim-textobj-user'
call plug#end()
