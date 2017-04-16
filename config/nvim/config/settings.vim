" More like default settings.
" Let vim know that I use fish
set shell=/bin/bash

" Set ctags lookup
set tags+=.tags,.git/tags

" Use the backspace key as expected
set backspace=2

" Copy/paste from the clipboard. For Windows/Mac use: set clipboard=unnamed
set clipboard+=unnamedplus

" remove backups and swapfiles
set nobackup                     " disable backups
set noswapfile                   " it's 2015, NeoVim.

" Tabs and spaces
set smartindent
set shiftwidth=2  " operation >> indents 2 columns; << unindents 2 columns
set tabstop=2     " an hard TAB displays as 2 columns
set shiftround    " round indent to multiple of 'shiftwidth'
set expandtab
" It seems that polyglot doesn't handle this well.

set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch


" Turn off folding for good
" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable

" Splits
" Resize splits when the window is resized
" au VimResized * exe "normal! \<c-w>="

set splitbelow
set splitright

" Tab wrapper
:command! PromoteToLet :call PromoteToLet()

" Statusline
set statusline=%<%f\ [%{&ft}]\ %-4(%m%)%=

" let g:test#custom_strategies = {'terminal_split': function('SplitStrategy')}
let g:test#strategy = 'neoterm'

" Auto Pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '|':'|'}