"
" Interface
"
" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" Set window width
set winwidth=80

" do not redraw while running macros (much faster) (LazyRedraw)
set lazyredraw

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" set omnifunc=syntaxcomplete#Complete
set list listchars+=trail:•,extends:→,precedes:←,nbsp:‗,eol:¬

" Tell vim that powerline is loaded
let g:powerline_loaded = 1

" set relativenumber
set number
set ruler
set cursorline

" colorscheme molokai
colorscheme Tomorrow-Night-Bright

