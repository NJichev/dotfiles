" More like default settings.
" Let vim know to use bash

" Set ctags lookup
set tags=.tags,.git/tags

" Use the backspace key as expected
set backspace=2

" Copy/paste from the clipboard. For Windows/Mac use: set clipboard=unnamed
set clipboard+=unnamedplus

" remove backups and swapfiles
set nobackup                     " disable backups
set noswapfile                   " it's 2015, NeoVim.

" " Tabs and spaces
set smartindent
set autoindent
set shiftwidth=2  " operation >> indents 2 columns; << unindents 2 columns
set tabstop=2     " an hard TAB displays as 2 columns
set shiftround    " round indent to multiple of 'shiftwidth'
set expandtab
" " It seems that polyglot doesn't handle this well.

set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

"auto save and restore folds
set viewoptions-=options

" Better? completion on command line
set wildmenu
" What to do when I press 'wildchar'. Worth tweaking to see what feels right.
set wildmode=list:full
set completeopt+=menu,menuone,longest,noselect
" Some options
set history=500   " keep 500 lines of command line history
set ruler   " show the cursor position all the time

" Splits
" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

set splitbelow
set splitright

" Tab wrapper
:command! PromoteToLet :call PromoteToLet()

" Statusline
set statusline=%<%f\ [%{&ft}]\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" Test-vim
let g:neoterm_default_mod = 'botright'
let g:test#strategy = 'neoterm'
"
"  `.vim/after/ftplugin/elixir.vim` or `.vimrc`, whatever you prefer
function! ElixirUmbrellaTransform(cmd) abort
  if match(a:cmd, 'apps/') != -1
    return substitute(a:cmd, 'mix test apps/\([^/]*\)/', 'mix cmd --app \1 mix test --color ', '')
  else
    return a:cmd
  end
endfunction

let g:test#custom_transformations = {'elixir_umbrella': function('ElixirUmbrellaTransform')}
let g:test#transformation = 'elixir_umbrella'

let test#python#runner = 'pytest'
" Auto Pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}

if has("nvim")
  set inccommand=split
endif

let g:ruby_indent_assignment_style = 'variable'
