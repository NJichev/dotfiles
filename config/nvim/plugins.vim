if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.vim/plugged')
  " Colorschemes
  Plug 'quanganhdo/grb256'
  Plug 'morhetz/gruvbox'

  " Autocomplete
  Plug 'roxma/nvim-completion-manager'

  " NerdTree
  Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }

  " Tags
  Plug 'ludovicchabant/vim-gutentags'

  " Syntax for many languages
  Plug 'sheerun/vim-polyglot'

  " Testing for different languages
  Plug 'janko-m/vim-test'
  Plug 'njichev/alter-vim'
  Plug 'kassio/neoterm'

  " Autopairs
  Plug 'jiangmiao/auto-pairs'

  " Ruby plugins
  Plug 'roxma/ncm-rct-complete', { 'for' : 'ruby' }
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'tpope/vim-bundler', { 'for': 'ruby' }
  Plug 'tpope/vim-rake', { 'for': 'ruby' }
  Plug 'bruno-/vim-ruby-fold', { 'for': 'ruby' }
  Plug 'nelstrom/vim-textobj-rubyblock/', { 'for' : 'ruby' }
  Plug 'tpope/vim-endwise'

  " Elixir
  Plug 'slashmili/alchemist.vim', { 'for' : 'elixir' }
  Plug 'elixir-lang/vim-elixir', { 'for' : 'elixir' } 
  Plug 'thinca/vim-ref', { 'for' : 'elixir' }
  Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh', 'for' : 'elixir' }

  " Rust
  Plug 'rust-lang/rust.vim', { 'for' : 'rust' }

  " Tpope utility plugins
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-sleuth'

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

  Plug 'honza/vim-snippets'
  Plug 'SirVer/ultisnips'

  " Vim stuff
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }

  Plug 'AndrewRadev/switch.vim'
  Plug 'AndrewRadev/splitjoin.vim'

  Plug 'tweekmonster/startuptime.vim'

  " Ruby text objects
  Plug 'kana/vim-textobj-user'

  " Git gutter
  Plug 'airblade/vim-gitgutter'
call plug#end()
