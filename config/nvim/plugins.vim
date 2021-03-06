if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.vim/plugged')
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

  " Colorschemes
  Plug 'quanganhdo/grb256'
  Plug 'morhetz/gruvbox'
  Plug 'edkolev/tmuxline.vim'

  " better matchit
  Plug 'andymass/vim-matchup'

  " Completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Linting
  " Plug 'w0rp/ale'
  "Camel Case motions
  Plug 'bkad/CamelCaseMotion'

  " NerdTree
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

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

  " Text objects
  Plug 'kana/vim-textobj-user'

  " Syntax for many languages
  let g:polyglot_disabled = ['elixir']
  Plug 'sheerun/vim-polyglot'
call plug#end()
