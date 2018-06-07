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
set list listchars+=tab:\|\ ,trail:•,extends:→,precedes:←,nbsp:‗,eol:¬
" Tell vim that powerline is loaded
let g:powerline_loaded = 1

set number
set relativenumber
set ruler
set cursorline
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent " always set autoindenting on

if has("nvim")
  set termguicolors
endif

set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'

colorscheme gruvbox
"
" set cc=80
