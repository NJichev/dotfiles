" Basic options {{{
  syntax on
  filetype on
  filetype indent on
  filetype plugin on

  set rtp+=~/.nvim/bundle/Vundle.vim

  " Map the leader keys
  let mapleader=","
  let maplocalleader="\\"

  " Set ctags lookup
  set tags+=.tags,.git/tags;$HOME
  " set tags+=.tags,.git/tags
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

  " do not redraw while running macros (much faster) (LazyRedraw)
  set lazyredraw

  " Set 5 lines to the cursor - when moving vertically using j/k
  set so=5
  set omnifunc=syntaxcomplete#Complete
  set list listchars=tab:»\ ,trail:•,extends:→,precedes:←,nbsp:‗,eol:¬
  set nobackup                     " disable backups
  set noswapfile                   " it's 2015, NeoVim.

" }}}
" Plugin settings {{{
  " Plug {{{
    call plug#begin('~/.vim/plugged')
    " Themes and interface
    Plug 'reedes/vim-thematic'
    Plug 'tomasr/molokai'
    Plug 'morhetz/gruvbox'

    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    " {{{
      map <F2> :NERDTreeTabsToggle<CR>
    " }}}

    Plug 'jiangmiao/auto-pairs'
    " {{{
      let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
    " }}}-1
    "
    Plug 'xuhdev/SingleCompile'
    " {{{
      nnoremap <F8> :SCCompile<cr>
      nnoremap <F9> :SCCompileRun<cr>
    " }}}

    " Web and template syntax and more {{{
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
    Plug 'othree/yajs.vim'
    Plug 'evanmiller/nginx-vim-syntax'
    Plug 'gkz/vim-ls'
    " }}}

    " Tags {{{
    Plug 'ludovicchabant/vim-gutentags'
    " {{{ Gutentags
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
    " }}}
    " }}}


    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Ruby plugins
    Plug 'skalnik/vim-vroom', { 'for': 'ruby' }
    Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
    Plug 'tpope/vim-rails', { 'for': 'ruby' }
    Plug 'bruno-/vim-ruby-fold', { 'for': 'ruby' }
    Plug 'tpope/vim-endwise', { 'for': 'ruby' }

    " Elixir
    Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }

    " Tpope utility plugins {{{
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-unimpaired'
    " Plug 'tpope/vim-env'
    " }}}

    " Other utility plugins {{{
    Plug 'mattn/gist-vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'easymotion/vim-easymotion'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tomtom/tlib_vim'
    Plug 'tomtom/tcomment_vim'
    " }}}

    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    " {{{
    let g:goyo_margin_top=0
    let g:goyo_margin_bottom=0
    let g:goyo_linenr=2

    let g:limelight_conceal_ctermfg = 'black'

    function! GoyoBefore()
      silent !tmux set status off
      normal zR
      set nonumber
      " Limelight
    endfunction

    function! GoyoAfter()
      silent !tmux set status on
      set number
      " Limelight!
    endfunction

    let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]
    " }}}

    " Autocompletion and spellcheck stuff {{{
    Plug 'Shougo/deoplete.nvim'
    Plug 'Shougo/neoinclude.vim'
    Plug 'neomake/neomake'

    " Yes, there are vim stuff here
    Plug 'vim-scripts/SyntaxComplete'
    Plug 'Shougo/neco-vim'
    " }}}

    " Vim fast searching and moving around {{{
    Plug 'dyng/ctrlsf.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'rking/ag.vim'
    " }}}

    " Vim stuff {{{
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'AndrewRadev/switch.vim'
    Plug 'Shougo/vimproc.vim', { 'do': 'make' }
    Plug 'xolox/vim-misc'
    Plug 'Rykka/InstantRst'
    Plug 'tommcdo/vim-exchange'
    Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
    Plug 'beloglazov/vim-textobj-quotes'
    Plug 'Julian/vim-textobj-brace'
    " }}}

    call plug#end()
  " }}}

  " Ruby mode {{{
    let ruby_fold = 1

    " Set up ruby source for deoplete
    let g:deoplete#sources#omni#input_patterns = {
            \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
            \}
  " }}}
  " Nerdcommenter {{{
    let NERDSpaceDelims=1
  " }}}
  " Emmet {{{
    let g:user_emmet_install_global = 0
    autocmd FileType html,css,erb EmmetInstall
  " }}}
"}}}
  " UltiSnips {{{
    inoremap <C-x><C-k> <NOP>
    let g:UltiSnipsExpandTrigger='<C-j>'
    let g:UltiSnipsListSnippets='<C-s>'
    let g:UltiSnipsJumpForwardTrigger='<C-j>'
    let g:UltiSnipsJumpBackwardTrigger='<C-k>'
  " }}}
  " Surround {{{
    autocmd FileType htmldjango let b:surround_{char2nr("v")} = "{{ \r }}"
    autocmd FileType htmldjango let b:surround_{char2nr("t")} = "{% \r %}"

    " Bold, italic and underline in TeX/LaTeX
    autocmd FileType tex let b:surround_{char2nr("b")} = "\\textbf{\r}"
    autocmd FileType tex let b:surround_{char2nr("i")} = "\\textit{\r}"
    autocmd FileType tex let b:surround_{char2nr("u")} = "\\underline{\r}"

    " Bold and italic in markdown
    autocmd FileType mkd let b:surround_{char2nr("b")} = "**\r**"
    autocmd FileType mkd let b:surround_{char2nr("i")} = "_\r_"

    " Bold and italic in rst
    autocmd FileType rst let b:surround_{char2nr("b")} = "**\r**"
    autocmd FileType rst let b:surround_{char2nr("i")} = "*\r*"
  " }}}
  " InstantRst {{{
    let g:instant_rst_browser = "google-chrome-stable"
  " }}}
  " Riv {{{
    let g:riv_fold_auto_update = 0
    let g:riv_i_tab_pum_next = 0
    let g:riv_i_tab_user_cmd = "\<c-g>u\<c-r>=UltiSnips#ExpandSnippet()\<cr>"
    " }}}
  " Neomake {{{
    autocmd! BufWritePost * Neomake
    let g:neomake_ruby_enabled_makers = ['rubocop']
  " }}}
  " Deoplete {{{
    let g:python_host_prog = '/usr/bin/python2.7'
    let g:python3_host_prog = '/usr/bin/python3'

    " 4.11 Deoplete autocomplete settings {{{
    " -----------------------------------------------------
    let g:deoplete#enable_at_startup=1
    let g:deoplete#enable_refresh_always=0
    let g:deoplete#file#enable_buffer_path=1

    let g:deoplete#sources={}
    let g:deoplete#sources._    = ['buffer', 'file', 'ultisnips']
    let g:deoplete#sources.ruby = ['buffer', 'member', 'file', 'ultisnips']
    let g:deoplete#sources.vim  = ['buffer', 'member', 'file', 'ultisnips']
    let g:deoplete#sources['javascript.jsx'] = ['buffer', 'file', 'ultisnips', 'ternjs']
    let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni', 'ultisnips']
    let g:deoplete#sources.scss = ['buffer', 'member', 'file', 'omni', 'ultisnips']
    let g:deoplete#sources.html = ['buffer', 'member', 'file', 'omni', 'ultisnips']
"}}}

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

    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
  " }}}
  " }}}
" Mappings {{{
  " Easily scroll up/down in insert mode
  inoremap <C-b> <C-x><C-y>
  inoremap <C-f> <C-x><C-e>
  " Insert a hash rocket with <c-l>
  imap <c-l> <space>=><space>

  nnoremap <cr> :VroomRunTestFile<cr>
  " Because the Esc key is too far...
  inoremap jk <Esc>

  " Make the current word UPPERCASE and
  " move the cursor at the end of the word
  inoremap <C-u> <esc>viwUea
  nnoremap <c-u> viwUe

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

  " Close any open tabs also pay tribute to AndrewRadev
  nnoremap QQ :QuitTab<cr>
  command! QuitTab call s:QuitTab()
  function! s:QuitTab() " {{{
    try
      tabclose
    catch /E784/ " Can't close last tab
      qall
    endtry
  endfunction " }}}

  " Toggle spellcheck
  let g:myLang = 0
  let g:myLangList = ['nospell', 'en_us', 'bg']

  " Sudo to write
  cnoremap w!! w !sudo tee % >/dev/null

  " Switching between tabs {{{
    nnoremap K :tabn<CR>
    nnoremap J :tabp<CR>
  " }}}
  " Improve up/down movement on wrapped lines {{{
    nnoremap j gj
    nnoremap k gk
    xnoremap j gj
    xnoremap k gk
  "}}}
  " Reselect visual block after indent/outdent {{{
    vnoremap < <gv
    vnoremap > >gv
  " }}}
  " Eazily go to the beginning/end of the line {{{
    noremap H ^
    noremap L $
    vnoremap L g_
  " }}}
  " Dirty tmux integration
  nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
  " CtrlSF setup {{{
    nnoremap <Leader>sf :CtrlSF<Space>
  " }}}
  " FZF setup

  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
  " Fuzzy finder: ignore stuff that can't be opened, and generated files
  let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

  nnoremap <Leader>f :FZF<cr>
  " Open files in horizontal split
  nnoremap <silent> <Leader>s :call fzf#run({
  \   'down': '40%',
  \   'sink': 'botright split' })<CR>

    " Open files in vertical horizontal split
  nnoremap <silent> <Leader>v :call fzf#run({
  \   'right': winwidth('.') / 2,
  \   'sink':  'vertical botright split' })<CR>
" }}}
" Interface {{{
    " Colors {{{

    " http://terminal.sexy/ is an awesome website to create more :)
    " Other cool dark 256 color colorschemes:
    "
    " colorscheme neverland
    " let g:seoul256_background = 233
    " colo seoul256
    " " airline
    " let g:airline_powerline_fonts = 1
    " let g:airline_theme = 'powerlineish'
    " let g:airline_powerline_fonts = 1
    " let g:airline#extensions#tabline#enabled = 1
    " let g:Powerline_symbols = 'fancy'
    " let g:airline_exclude_filetypes=['netrw','diff','undotree','gundo','tagbar']
    " let g:airline_linecolumn_prefix = ' '
    " let g:airline_section_z='%3p%% '.g:airline_linecolumn_prefix.'%3l:%c'
    " let g:airline_detect_whitespace=0 " turn off the whitespace extension
    " "enable/disable showing a summary of changed hunks under source control.
    " let g:airline#extensions#hunks#enabled = 1
    " "enable/disable showing only non-zero hunks.
    " let g:airline#extensions#hunks#non_zero_only = 1
    " "set hunk count symbols.
    " let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
    "
    " "set tmuxline preset
    " let g:tmuxline_preset = {
    "       \'a'    : '#S',
    "       \'b'    : '#W',
    "       \'c'    : '#H',
    "       \'win'  : '#I #W',
    "       \'cwin' : '#I #W',
    "       \'x'    : '%a',
    "       \'y'    : '#W %R',
    "       \'z'    : '#H'}
    "

    " Thematic {{{
      " Cycle through thematic themes.
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
    " }}}

    " Blend the sign column background.
    let g:gruvbox_sign_column='dark0'
    let g:gruvbox_contrast_dark='soft'
  " }}}
  set number
  set ruler
  set cursorline

  " Only show cursorline in the current window and in normal mode.
  augroup cline "{{{
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
  augroup END "}}}
" }}}
" Tabs and spaces {{{
    set smartindent
    set shiftwidth=2  " operation >> indents 4 columns; << unindents 4 columns
    set tabstop=2     " an hard TAB displays as 2 columns
    set shiftround    " round indent to multiple of 'shiftwidth'
    set expandtab
" }}}
" Searching {{{
  " Use sane regexes.
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

  " Centers the screen on searching {{{
    nnoremap n nzzzv
    nnoremap N Nzzzv
  " }}}
" }}}
" Folding {{{
  set foldlevelstart=0
  fu! CustomFoldText() " {{{
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
      let line = getline(v:foldstart)
    else
      let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = repeat(" ", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
  endf "}}}
  set foldtext=CustomFoldText()
  set foldmethod=indent
  set foldlevelstart=20

  let javaScript_fold=1

  " It's easier to use space...
  " nnoremap <space> za
,
  " Focus the current folding
  nnoremap <leader>z zMzvzz
" }}}
" Quick editing {{{
  nnoremap <leader>ev :tabedit $MYVIMRC<cr>

  if has("autocmd")
    autocmd bufwritepost init.vim source $MYVIMRC
  endif

  nnoremap <leader>eb :tabedit ~/.bashrc<cr>
  nnoremap <leader>et :tabedit ~/.tmux.conf<cr>
  " zsh
  nnoremap <leader>ez :tabedit ~/.zshrc<cr>
" }}}
" Splits {{{
  " Resize splits when the window is resized
  au VimResized * exe "normal! \<c-w>="

  set splitbelow
  set splitright

  " Resizing splits {{{
    nnoremap <left>  <c-w><
    nnoremap <right> <c-w>>
    nnoremap <up>    <c-w>-
    nnoremap <down>  <c-w>+
  " }}}
" }}}
" Filetype specific settings {{{
  " Automaticlly set filetypes {{{
    au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif
    let g:tex_flavor = "latex"
  " }}}
  " C++ {{{
    augroup ft_cpp
      au!
      au FileType cpp setlocal foldmethod=syntax
    augroup END
  "}}}
  " C {{{
  "
    augroup ft_c
      au!
      au FileType c setlocal foldmethod=syntax
    augroup END
  "}}}
  " CoffeeScript {{{
    augroup ft_coffee
      au!
      au FileType coffee setlocal foldmethod=indent
      au FileType coffee setlocal shiftwidth=2
      au FileType coffee setlocal tabstop=2
      au FileType coffee setlocal expandtab
      au FileType coffee setlocal softtabstop=2
      au FileType coffee setlocal shiftround
    augroup END
  " }}}
  " Vimscript {{{
    augroup ft_viml
      au!
      au FileType vim setlocal foldmethod=marker
    augroup END
  " }}}
  " " CTP {{{
  "   augroup ft_ctp
  "     au!
  "     au FileType ctp setlocal shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
  "     au FileType ctp setlocal tabstop=4     " an hard TAB displays as 4 columns
  "     au FileType ctp setlocal expandtab     " insert spaces when hitting TABs
  "     au FileType ctp setlocal softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
  "     au FileType ctp setlocal shiftround    " round indent to multiple of 'shiftwidth'
  "     au FileType ctp setlocal autoindent    " align the new line indent with the previous line
  "   augroup END
  " " }}}
  " JavaScript {{{
    augroup ft_js
      au!
      au FileType javascript setlocal foldmethod=syntax
      au FileType javascript setlocal shiftwidth=2
      au FileType javascript setlocal tabstop=2
      au FileType javascript setlocal expandtab
      au FileType javascript setlocal softtabstop=2
      au FileType javascript setlocal shiftround
    augroup END
  " }}}
  " Clojure {{{
    augroup ft_clojure
      au!
      au FileType clojure setlocal foldmethod=syntax
    augroup END
  " }}}
  " HTML {{{
    augroup ft_html
      au!
      au FileType htmldjango.html setlocal shiftwidth=2
      au FileType htmldjango.html setlocal tabstop=2
      au FileType htmldjango.html setlocal expandtab
      au FileType htmldjango.html setlocal softtabstop=2
      au FileType htmldjango.html setlocal shiftround
    augroup END
  " }}}
  " Markdown {{{
    augroup ft_mkd
      au!
      au FileType mkd setlocal textwidth=80
      au FileType mkd nnoremap <buffer> <leader><space> :Goyo<CR>
    augroup END
  " }}}
  " " reStructuredText {{{
  "   augroup ft_rst
  "     au!
  "     au FileType rst setlocal textwidth=79
  "     au FileType rst setlocal colorcolumn=80
  "     au FileType rst nnoremap <buffer> <leader><space> :Goyo<CR>
  "   augroup END
  " " }}}
  " " LaTeX {{{
  "   augroup ft_tex
  "     au!
  "     au FileType tex setlocal textwidth=80
  "     au FileType tex setlocal foldmethod=manual
  "   augroup END
  " " }}}
  " CSS {{{
    augroup ft_css
      au!
      au FileType css setlocal foldmethod=syntax
    augroup END
  " }}}
  " SCSS {{{
    augroup ft_scss
      au!
      au FileType scss setlocal foldmethod=marker
      au FileType scss setlocal foldmarker={,}
      au FileType scss setlocal shiftwidth=2
      au FileType scss setlocal tabstop=2
      au FileType scss setlocal expandtab
      au FileType scss setlocal softtabstop=2
      au FileType scss setlocal shiftround
    augroup END
  " }}}
  " Sass {{{
    augroup ft_sass
      au!
      au FileType sass setlocal foldmethod=indent
      au FileType sass setlocal shiftwidth=2
      au FileType sass setlocal tabstop=2
      au FileType sass setlocal expandtab
      au FileType sass setlocal softtabstop=2
      au FileType sass setlocal shiftround
    augroup END
  " }}}
  " Nonvim {{{
    augroup nonvim
      au BufRead *.png,*.jpg,*.pdf,*.gif,*.xls*,*.scpt sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!
    augroup END
  " }}}
" }}}

filetype plugin indent on
