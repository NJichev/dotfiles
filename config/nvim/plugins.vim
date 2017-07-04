if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.vim/plugged')
  " Colorschemes
  Plug 'quanganhdo/grb256'
  Plug 'tamelion/neovim-molokai'
  Plug 'morhetz/gruvbox'

  " Go back to deoplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/deoplete-rct'
  Plug 'fishbullet/deoplete-ruby'
  Plug 'wellle/tmux-complete.vim'

  "Ale linter
  Plug 'w0rp/ale'

  " Syntax for many languages
  Plug 'sheerun/vim-polyglot'

  " Html snippets, thank god.
  Plug 'mattn/emmet-vim'

  " Testing for different languages
  Plug 'janko-m/vim-test'
  Plug 'njichev/alter-vim'

  " Autopairs
  Plug 'jiangmiao/auto-pairs'

  " Ruby plugins
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'bruno-/vim-ruby-fold', { 'for': 'ruby' }
  Plug 'tpope/vim-endwise'

  " Elixir
  Plug 'slashmili/alchemist.vim', { 'for' : 'elixir' }

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
  " Vim fast searching and moving around
  Plug 'dyng/ctrlsf.vim'

  Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
  Plug 'junegunn/fzf.vim'

  Plug 'honza/vim-snippets'
  Plug 'SirVer/ultisnips'

  Plug 'godlygeek/tabular'

  " Vim stuff
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }

  Plug 'AndrewRadev/switch.vim'
  Plug 'AndrewRadev/splitjoin.vim'
call plug#end()

filetype plugin indent on
syntax enable
