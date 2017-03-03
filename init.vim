set runtimepath+=/home/njichev/dotfiles/config/nvim/plugins/repos/github.com/Shougo/dein.vim

if &compatible
  set nocompatible               " Be iMproved
endif


if dein#load_state('/home/njichev/dotfiles/config/nvim/plugins/')
  call dein#begin('/home/njichev/dotfiles/config/nvim/plugins/')

  " Let dein manage dein
  " Required:
  call dein#add('/home/njichev/dotfiles/config/nvim/plugins/repos/github.com/Shougo/dein.vim')

  " Add or remove plugins here:

  " Colorschemes
  call dein#add('dracula/vim')
  call dein#add('reedes/vim-thematic')
  call dein#add('tomasr/molokai')
  call dein#add('morhetz/gruvbox')

  " Syntax for many languages
  call dein#add('sheerun/vim-polyglot')


  call dein#add('rstacruz/vim-closer')

  " Gutentags
  call dein#add('ludovicchabant/vim-gutentags')

" Testing for different languages
call dein#add('janko-m/vim-test')

" Ruby plugins
call dein#add('vim-ruby/vim-ruby')
call dein#add('tpope/vim-bundler')
call dein#add('tpope/vim-rake')
call dein#add('tpope/vim-rails')
call dein#add('bruno-/vim-ruby-fold')
call dein#add('tpope/vim-endwise')

" Elixir
call dein#add('slashmili/alchemist.vim')

" Tpope utility plugins
call dein#add('tpope/vim-dispatch')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-fugitive')
" call dein#add('tpope/vim-sleuth')
call dein#add('tpope/vim-unimpaired')
" call dein#add('tpope/vim-env')

" Other utility plugins
call dein#add('mattn/gist-vim')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('MarcWeber/vim-addon-mw-utils')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tomtom/tlib_vim')
call dein#add('tomtom/tcomment_vim')

" Nvim plugins
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neoinclude.vim')
call dein#add('neomake/neomake')

" Yes, there are vim stuff here
call dein#add('vim-scripts/SyntaxComplete')
" Autocompletion source for vim.
call dein#add('Shougo/neco-vim')

" Vim fast searching and moving around
call dein#add('dyng/ctrlsf.vim')
call dein#add('junegunn/fzf')
call dein#add('junegunn/fzf.vim')

" Vim stuff
call dein#add('AndrewRadev/splitjoin.vim')
call dein#add('AndrewRadev/switch.vim')
call dein#add('Shougo/vimproc.vim')
call dein#add('xolox/vim-misc')
call dein#add('Rykka/InstantRst')
call dein#add('tommcdo/vim-exchange')
call dein#add('kana/vim-textobj-user')
call dein#add('beloglazov/vim-textobj-quotes')
call dein#add('Julian/vim-textobj-brace')

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
" if dein#check_install()
"  call dein#install()
" endif

"End dein Scripts-------------------------
"
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
" set omnifunc=syntaxcomplete#Complete
" set list listchars=trail:•,extends:→,precedes:←,nbsp:‗,eol:¬
set nobackup                     " disable backups
set noswapfile                   " it's 2015, NeoVim.



" Themes and interface
map <F2> :NERDTreeTabsToggle<CR>



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
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_new = 1


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
" let test#strategy = {
"   \ 'nearest': 'basic',
"   \ 'file':    'basic',
"   \ 'suite':   'dispatch',
" \}
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" make test commands execute using dispatch.vim
let test#strategy = "dispatch"
" let test#strategy = 'basic'

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
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
nnoremap <Leader>f :FZF<cr>

" Interface
" Thematic
" Cycle through thematic themes.
" set termguicolors
nnoremap <Leader>tt :ThematicNext<CR>

" let g:thematic#defaults = {
" \ 'colorscheme': 'molokai',
" \ }
let g:gruvbox_contrast_light='hard'
"
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
    \ },
    \ 'dracula': {
    \   'colorscheme': 'dracula',
    \   'theme_name': 'dracula',
    \ },
\ }
let g:thematic#theme_name='gruvbox_light'
" let g:thematic#theme_name='dracula'

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
