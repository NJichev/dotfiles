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

  " Syntax for many languages
  call dein#add('sheerun/vim-polyglot')

  " Html snippets, thank god.
  call dein#add('mattn/emmet-vim')

  " Testing for different languages
  call dein#add('janko-m/vim-test')
  call dein#add('njichev/alter-vim')

  " Autopairs
  call dein#add('jiangmiao/auto-pairs', {'on_i' : 1})

  " Ruby plugins
  call dein#add('vim-ruby/vim-ruby', {'on_ft': 'ruby'})
  call dein#add('tpope/vim-rails', {'on_ft': 'ruby'})
  call dein#add('bruno-/vim-ruby-fold', {'on_ft': 'ruby'})
  call dein#add('tpope/vim-endwise')


  " Elixir
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
  call dein#add('christoomey/vim-tmux-navigator')

  call dein#add('terryma/vim-multiple-cursors',
        \{ 'on_map' : { 'n' : ['<C-n>', '<C-p>'], 'x' : '<C-n>'}})

  call dein#add('tomtom/tcomment_vim',
        \{'on_map': 'gc', 'on_cmd' : 'TComment'})

  " lazy load on insert mode
  call dein#add('Shougo/deoplete.nvim',
        \{'on_i': 1})

  " call dein#add('kassio/neoterm')
  "
  " Vim fast searching and moving around
  call dein#add('dyng/ctrlsf.vim',
        \{'on_cmd' : 'CtrlSF'})

  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim')

  call dein#add('honza/vim-snippets')
  call dein#add('SirVer/ultisnips',
        \{'on_map' : { 'i' : ['<TAB>'] }})

  " Vim stuff
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
