if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.vim/plugged')
  " Colorschemes
  Plug 'quanganhdo/grb256'
  Plug 'morhetz/gruvbox'

  " Linting
  " Plug 'neomake/neomake'

  " Autocomplete
  " A dependency of 'ncm2'.
  Plug 'roxma/nvim-yarp'

  " v2 of the nvim-completion-manager.
  Plug 'ncm2/ncm2'

  "Add some ncm2 sources
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-tmux'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-ultisnips'

  " LanguageServer client for NeoVim.
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

  " Jedi-vim
  Plug 'davidhalter/jedi-vim', { 'for' : 'python' }

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
  Plug 'njichev/alter-vim'
  Plug 'kassio/neoterm'

  " Autopairs
  Plug 'jiangmiao/auto-pairs'

  " Ruby plugins
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'tpope/vim-bundler', { 'for': 'ruby' }
  Plug 'tpope/vim-rake', { 'for': 'ruby' }
  Plug 'bruno-/vim-ruby-fold', { 'for': 'ruby' }
  Plug 'nelstrom/vim-textobj-rubyblock/', { 'for' : 'ruby' }
  Plug 'tpope/vim-endwise'

  " Elixir
  Plug 'elixir-editors/vim-elixir', { 'for' : 'elixir' }

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

  Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }

  " Ruby text objects
  Plug 'kana/vim-textobj-user'

  " Games
  Plug 'johngrib/vim-game-code-break'

  " Show off
  Plug 'DougBeney/pickachu', { 'on' : 'Pick' }
call plug#end()
