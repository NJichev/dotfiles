if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.vim/plugged')
  " Colorschemes
  Plug 'quanganhdo/grb256'
  Plug 'morhetz/gruvbox'

  " Go back to deoplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/deoplete-rct'
  Plug 'fishbullet/deoplete-ruby'

  " Tags
  Plug 'ludovicchabant/vim-gutentags'

  " Nerdtree
  Plug 'scrooloose/nerdtree'

  " Syntax for many languages
  Plug 'sheerun/vim-polyglot'

  " Testing for different languages
  Plug 'janko-m/vim-test'
  Plug '~/alter-vim'
  Plug 'kassio/neoterm'

  " Autopairs
  Plug 'jiangmiao/auto-pairs'

  " Ruby plugins
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'tpope/vim-bundler', { 'for': 'ruby' }
  Plug 'tpope/vim-rake', { 'for': 'ruby' }
  Plug 'bruno-/vim-ruby-fold', { 'for': 'ruby' }
  Plug 'tpope/vim-endwise'

  " Elixir
  Plug 'slashmili/alchemist.vim', { 'for' : 'elixir' }
  Plug 'elixir-lang/vim-elixir'
  Plug 'thinca/vim-ref'
  Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }

  " Rust
  Plug 'rust-lang/rust.vim'

  " Tpope utility plugins
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-unimpaired'

  " Other utility plugins
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tomtom/tcomment_vim'

  " Alignment
  Plug 'godlygeek/tabular'

  " Vim fast searching and moving around
  Plug 'dyng/ctrlsf.vim'

  Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
  Plug 'junegunn/fzf.vim'

  Plug 'honza/vim-snippets'
  Plug 'SirVer/ultisnips'

  " Vim stuff
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }

  Plug 'AndrewRadev/switch.vim'
  Plug 'AndrewRadev/splitjoin.vim'

  Plug 'tweekmonster/startuptime.vim'

  " Ruby text objects
  Plug 'kana/vim-textobj-user'
  Plug 'nelstrom/vim-textobj-rubyblock/'

  " Git gutter
  Plug 'airblade/vim-gitgutter'
call plug#end()

filetype plugin indent on
syntax enable
