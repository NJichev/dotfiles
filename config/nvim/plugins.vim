if &compatible
  set nocompatible               " Be iMproved
endif

if dein#load_state('~/.vim/bundle/')
  call dein#begin('~/.vim/bundle/')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove plugins here:

  " Colorschemes
  call dein#add('quanganhdo/grb256')
  call dein#add('tomasr/molokai')
  call dein#add('chriskempson/vim-tomorrow-theme')

  " Syntax for many languages
  call dein#add('sheerun/vim-polyglot')

  " Html snippets, thank god.
  call dein#add('mattn/emmet-vim')

  " Gutentags
  call dein#add('ludovicchabant/vim-gutentags')

  " Testing for different languages
  call dein#add('janko-m/vim-test')
  call dein#add('NJichev/alter-vim')

  " Autopairs
  call dein#add('jiangmiao/auto-pairs', {'on_i' : 1})

  " Ruby plugins
  " call dein#add('fishbullet/deoplete-ruby')
  call dein#add('Shougo/deoplete-rct', {'on_ft': 'ruby'})
  call dein#add('vim-ruby/vim-ruby', {'on_ft': 'ruby'})
  call dein#add('tpope/vim-bundler', {'on_ft': 'ruby'})
  call dein#add('tpope/vim-rake', {'on_ft': 'ruby'})
  call dein#add('tpope/vim-rails', {'on_ft': 'ruby'})
  call dein#add('bruno-/vim-ruby-fold', {'on_ft': 'ruby'})
  call dein#add('tpope/vim-endwise')


  " Elixir
  call dein#add('elixir-lang/vim-elixir', {'on_ft' : 'elixir'})
  call dein#add('slashmili/alchemist.vim', {'on_ft' : 'elixir'})

  " Tpope utility plugins
  call dein#add('tpope/vim-repeat',
        \{'on_map' : '.'})

  call dein#add('tpope/vim-dispatch')
  call dein#add('tpope/vim-surround',
        \{'on_map' : {'n' : ['cs', 'ds', 'ys', ]}})

  call dein#add('tpope/vim-fugitive',
        \{ 'on_cmd' : [ 'Git', 'Gstatus', 'Gwrite', 'Glog', 'Gcommit', 'Gblame', 'Ggrep', 'Gdiff' ] })

  call dein#add('tpope/vim-unimpaired')

  " Other utility plugins
  call dein#add('mattn/gist-vim')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('MarcWeber/vim-addon-mw-utils')
  call dein#add('tomtom/tlib_vim')

  call dein#add('terryma/vim-multiple-cursors',
        \{ 'on_map' : { 'n' : ['<C-n>', '<C-p>'], 'x' : '<C-n>'}})

  call dein#add('tomtom/tcomment_vim',
        \{'on_map': 'gc', 'on_cmd' : 'TComment'})

  call dein#add('godlygeek/tabular',
        \{ 'on_cmd' : [ 'Tab', 'Tabularize' ] , 'augroup' : 'tabular' })

  " Nvim plugins
  " lazy load on insert mode
  call dein#add('Shougo/deoplete.nvim',
        \{'on_i': 1})

  call dein#add('Shougo/neoinclude.vim')
  call dein#add('neomake/neomake',
        \{'on_cmd': 'Neomake'})
  call dein#add('kassio/neoterm')

  " Yes, there are vim stuff here
  call dein#add('vim-scripts/SyntaxComplete')

  " Vim fast searching and moving around
  call dein#add('dyng/ctrlsf.vim',
        \{'on_cmd' : 'CtrlSF'})

  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  call dein#add('honza/vim-snippets')
  call dein#add('SirVer/ultisnips',
        \{'on_map' : { 'i' : ['<TAB>'] }})

  " Vim stuff
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('AndrewRadev/splitjoin.vim')
  call dein#add('AndrewRadev/switch.vim')
  call dein#add('xolox/vim-misc')
  call dein#add('Rykka/InstantRst')
  call dein#add('tommcdo/vim-exchange')
  call dein#add('kana/vim-textobj-user')
  call dein#add('beloglazov/vim-textobj-quotes')
  call dein#add('Julian/vim-textobj-brace')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
