set runtimepath+=/home/njichev/.vim/bundle/repos/github.com/Shougo/dein.vim
set runtimepath+=~/.vim/

runtime plugins.vim
runtime config/keybinds.vim
runtime config/functions.vim

" Let vim know that I use fish
set shell=/bin/bash

" Set ctags lookup
set tags+=.tags,.git/tags

" Use the backspace key as expected
set backspace=2

" Copy/paste from the clipboard. For Windows/Mac use: set clipboard=unnamed
set clipboard+=unnamedplus

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800
" Set window width
set winwidth=80

" do not redraw while running macros (much faster) (LazyRedraw)
set lazyredraw

" Set 5 lines to the cursor - when moving vertically using j/k
set so=7

" set omnifunc=syntaxcomplete#Complete
set list listchars+=trail:•,extends:→,precedes:←,nbsp:‗,eol:¬

" remove backups and swapfiles
set nobackup                     " disable backups
set noswapfile                   " it's 2015, NeoVim.

" " powerline
" let g:powerline_loaded = 1

" Gutentags
let g:gutentags_ctags_tagfile='.tags'
"
" Use ripper-tags to generate tags for Ruby.
let g:gutentags_ctags_executable_ruby='ripper-tags'
let g:gutentags_ctags_exclude = [
    \ '*.min.js',
    \ '*html*',
    \ 'jquery*.js',
    \ '*/vendor/*',
    \ '*/node_modules/*',
    \ '*/python2.7/*',
    \ '*/migrate/*.rb'
    \ ]

let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_write = 1


" Nerdcommenter
let NERDSpaceDelims=1

" Neomake
let g:neomake_ruby_enabled_makers = ['rubocop']

let g:deoplete#enable_at_startup = 1
" Set up ruby source for deoplete
let g:deoplete#sources#omni#input_patterns = {
  \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
  \}

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

" Deoplete
let g:python2_host_prog = "/usr/bin/python2.7"
let g:python3_host_prog = "/usr/sbin/python"


let g:deoplete#enable_refresh_always=0
let g:deoplete#file#enable_buffer_path=1
let g:deoplete#auto_complete_start_length=1

let g:deoplete#sources={}
let g:deoplete#sources._    = ['buffer', 'file', 'ultisnips']
let g:deoplete#sources.ruby = ['buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.vim  = ['buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources['javascript.jsx'] = ['buffer', 'file', 'ultisnips', 'ternjs']
let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.scss = ['buffer', 'member', 'file', 'omni', 'ultisnips']

" Tab wrapper
:command! PromoteToLet :call PromoteToLet()


call denite#custom#var('file_rec', 'command',
  \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

let s:denite_options = {'default' : {
  \ 'winheight' : 10,
  \ 'mode' : 'insert',
  \ 'quit' : 'true',
  \ 'highlight-matched-char' : 'Function',
  \ 'highlight-matched-range' : 'Function',
  \ 'direction': 'rightbelow',
  \ 'statusline' : 'false',
  \ 'prompt' : '➭',
  \ }}

function! s:profile(opts) abort
  for fname in keys(a:opts)
    for dopt in keys(a:opts[fname])
      call denite#custom#option(fname, dopt, a:opts[fname][dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)

" Interface
" Cycle through thematic themes.
" set termguicolors


" set relativenumber
set number
set ruler
set cursorline

" colorscheme molokai
colorscheme Tomorrow-Night-Bright

" " Tabs and spaces
set smartindent
set shiftwidth=2  " operation >> indents 2 columns; << unindents 2 columns
set tabstop=2     " an hard TAB displays as 2 columns
set shiftround    " round indent to multiple of 'shiftwidth'
set expandtab
" It seems that polyglot doesn't handle this well.

" Searching
" Use perl regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Clear search highlights
noremap <silent><Leader>/ :nohls<CR>

" Don't jump to the next match when * is pressed
nnoremap * *``

" Centers the screen on searching
nnoremap n nzzzv
nnoremap N Nzzzv

" Turn off folding for good
" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable

" Splits
" Resize splits when the window is resized
" au VimResized * exe "normal! \<c-w>="

set splitbelow
set splitright

" Open files with last place of cursour.

if has("autocmd")
  autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
  autocmd Filetype .exs set ft=elixir
  autocmd BufReadPost .exs set ft=elixir
  "Reload vimrc on change
  " autocmd! BufWritePost * Neomake
  " autocmd bufwritepost init.vim source $MYVIMRC
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif

" Open pictures and other stuff with other programms
augroup nonvim
  au BufRead *.png,*.jpg,*.pdf,*.gif,*.xls*,*.scpt sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!
augroup END
