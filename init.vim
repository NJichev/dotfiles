" Basic options
syntax on
filetype on
filetype indent on
filetype plugin on

set runtimepath+=~/dotfiles/nvim/plugins/

" Map the leader keys
let mapleader=","
let maplocalleader="\\"

" Set ctags lookup
set tags+=.tags,.git/tags

" Use the backspace key as expected
set backspace=2

" Copy/paste from the clipboard. For Windows/Mac use: set clipboard=unnamed
set clipboard+=unnamedplus

" Make you keyboard actually do something while you are switched to Cyrillic
" layout. Ripped off @StanAngeloff.
set langmap+=чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю\|,

" Get rid of the annoying |,= characters on vertical split bar separator and
" the filling characters of the folded lines.
set fillchars=vert:\ ,fold:\ 
" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800
" Set window width
set winwidth=80

" do not redraw while running macros (much faster) (LazyRedraw)
set lazyredraw

" Set 5 lines to the cursor - when moving vertically using j/k
set so=5
set omnifunc=syntaxcomplete#Complete
set list listchars=tab:»\ ,trail:•,extends:→,precedes:←,nbsp:‗,eol:¬
set nobackup                     " disable backups
set noswapfile                   " it's 2015, NeoVim.



" Plugins
call plug#begin('~/dotfiles/config/nvim/bundle')
" Themes and interface
Plug 'reedes/vim-thematic'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
map <F2> :NERDTreeTabsToggle<CR>

Plug 'jiangmiao/auto-pairs'
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}

Plug 'xuhdev/SingleCompile'
nnoremap <F8> :SCCompile<cr>
nnoremap <F9> :SCCompileRun<cr>

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'itchyny/vim-haskell-indent'

" Web and template syntax and more
Plug 'groenewege/vim-less'
Plug 'plasticboy/vim-markdown'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'mattn/emmet-vim'
Plug 'jdevera/vim-stl-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
Plug 'curist/vim-angular-template'
" Plug 'othree/yajs.vim'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'gkz/vim-ls'

" Tags
Plug 'ludovicchabant/vim-gutentags'
" Gutentags
let g:gutentags_tagfile='.tags'

" Use ripper-tags to generate tags for Ruby.
let g:gutentags_ctags_executable_ruby='ripper-tags'
let g:gutentags_exclude = [
    \ '*.min.js',
    \ '*html*',
    \ 'jquery*.js',
    \ '*/vendor/*',
    \ '*/node_modules/*',
    \ '*/python2.7/*',
    \ '*/migrate/*.rb'
    \ ]

let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_new = 1

" Snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Testing for different languages
Plug 'janko-m/vim-test'

" Ruby plugins
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'bruno-/vim-ruby-fold', { 'for': 'ruby' }
Plug 'tpope/vim-endwise'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Tpope utility plugins
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-env'

" Other utility plugins
Plug 'mattn/gist-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tlib_vim'
Plug 'tomtom/tcomment_vim'

" Nvim plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'neomake/neomake'

" Yes, there are vim stuff here
Plug 'vim-scripts/SyntaxComplete'
Plug 'Shougo/neco-vim'

" Vim fast searching and moving around
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'rking/ag.vim'

" Vim stuff
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'xolox/vim-misc'
Plug 'Rykka/InstantRst'
Plug 'tommcdo/vim-exchange'
Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'beloglazov/vim-textobj-quotes'
Plug 'Julian/vim-textobj-brace'

call plug#end()

" Haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`

" Ruby mode
let ruby_fold = 1

" Nerdcommenter
let NERDSpaceDelims=1

  let g:deoplete#enable_at_startup = 1
  " Set up ruby source for deoplete
  let g:deoplete#sources#omni#input_patterns = {
          \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
          \}
  " Neomake
  let g:neomake_ruby_enabled_makers = ['rubocop']

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
function! g:utils#tabComplete() abort
  let l:col = col('.') - 1

  if pumvisible()
    return "\<C-n>"
  else
    if !l:col || getline('.')[l:col - 1] !~# '\k'
      return "\<TAB>"
    else
      return "\<C-n>"
    endif
  endif
endfunction

" Insert <TAB> or select next match
inoremap <silent> <expr> <Tab> utils#tabComplete()

" Mappings
" Easily scroll up/down in insert mode
inoremap <C-b> <C-x><C-y>
inoremap <C-f> <C-x><C-e>

" Expand current path with %%
cnoremap <expr> %% expand('%:h').'/'

" Switch between test and poroduction code
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Call dispatch
nnoremap <leader>d :Dispatch<space>
" puts the caller
nnoremap <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>

" Run tests
let test#strategy = {
  \ 'nearest': 'basic',
  \ 'file':    'basic',
  \ 'suite':   'dispatch',
\}
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" make test commands execute using dispatch.vim
" let test#strategy = "dispatch"
let test#strategy = 'basic'

" Because the Esc key is too far...
inoremap jk <Esc>

" Format current paragraph (Ex-mode sucks...)
nnoremap <silent> Q gwip

" Change keyboard layouts
inoremap <C-z> <C-^>
cnoremap <C-z> <C-^>

" Select the whole line without the identation. Useful for python code...
nnoremap vv ^vg_

"leader commands
noremap <Leader>w :update<CR>
noremap <Leader>wq :x<CR>
noremap <Leader>q :quit<CR>
noremap <Leader>qq :quit!<CR>
noremap <Leader>ss :split<CR>
noremap <Leader>vv :vsplit<CR>

" Paste in the next line.
nnoremap <leader>p o<ESC>p

" Promote to let
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Switching between tabs
nnoremap K :tabn<CR>
nnoremap J :tabp<CR>

" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Eazily go to the beginning/end of the line
noremap H ^
noremap L $
vnoremap L g_

" Dirty tmux integration
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" CtrlSF setup
nnoremap <Leader>sf :CtrlSF<Space>

" FZF setup
" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

nnoremap <Leader>f :FZF<cr>
" Open files in horizontal split
" nnoremap <silent> <Leader>fs :call fzf#run({
" \   'down': '40%',
" \   'sink': 'botright split' })<CR>
"
" " Open files in vertical horizontal split
" nnoremap <silent> <Leader>fv :call fzf#run({
" \   'right': winwidth('.') / 2,
" \   'sink':  'vertical botright split' })<CR>

" Interface
" Thematic
" Cycle through thematic themes.
set termguicolors

nnoremap <Leader>tt :ThematicNext<CR>

" let g:thematic#defaults = {
" \ 'colorscheme': 'molokai',
" \ }

let g:thematic#themes={
    \ 'gruvbox_light': {
    \   'colorscheme': 'gruvbox',
    \   'background': 'light',
    \  },
    \ 'gruvbox_dark': {
    \   'colorscheme': 'gruvbox',
    \   'background': 'dark',
    \ },
    \ 'molokai': {
    \   'colorscheme': 'molokai',
    \   'theme_name': 'molokai',
    \ }
\ }
let g:thematic#theme_name='gruvbox_light'

set number
set ruler
set cursorline

" Tabs and spaces
set smartindent
set shiftwidth=2  " operation >> indents 2 columns; << unindents 2 columns
set tabstop=2     " an hard TAB displays as 2 columns
set shiftround    " round indent to multiple of 'shiftwidth'
set expandtab

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

" Quick editing
nnoremap <leader>ev :tabedit $MYVIMRC<cr>

nnoremap <leader>eb :tabedit ~/.bashrc<cr>
nnoremap <leader>et :tabedit ~/.tmux.conf<cr>
" zsh
nnoremap <leader>ez :tabedit ~/.zshrc<cr>

" Splits
" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

set splitbelow
set splitright

" Resizing splits with arrows
nnoremap <left>  <c-w><
nnoremap <right> <c-w>>
nnoremap <up>    <c-w>-
nnoremap <down>  <c-w>+

" Open files with last place of cursour.

if has("autocmd")
  "Reload vimrc on change
  " autocmd! BufWritePost * Neomake
  autocmd bufwritepost init.vim source $MYVIMRC
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif

" Open pictures and other stuff with other programms
augroup nonvim
  au BufRead *.png,*.jpg,*.pdf,*.gif,*.xls*,*.scpt sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!
augroup END
