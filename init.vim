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
  " set tags+=tags;$HOME
  set tags+=.tags,.git/tags

  " Use the backspace key as expected
  set backspace=2

  " Copy/paste from the clipboard. For Windows/Mac use: set clipboard=unnamed
  set clipboard+=unnamedplus

  " Don't try to highlight lines longer than 800 characters.
  set synmaxcol=800

  " do not redraw while running macros (much faster) (LazyRedraw)
  set lazyredraw

  " Set 5 lines to the cursor - when moving vertically using j/k
  set so=5
  set omnifunc=syntaxcomplete#Complete
  " set list
  " set list listchars=tab:▸\ ,trail:·
  " set list listchars=tab:»·,trail:·
  set list listchars=tab:»\ ,trail:•,extends:→,precedes:←,nbsp:‗,eol:¬
  set nobackup                     " disable backups
  set noswapfile                   " it's 2015, NeoVim.

" }}}
" Plugin settings {{{
  " Plug {{{
    call plug#begin('~/.vim/plugged')
    " Themes and interface
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'edkolev/tmuxline.vim'
    Plug 'reedes/vim-thematic'
    Plug 'tomasr/molokai'
    Plug 'morhetz/gruvbox'
    Plug 'goatslacker/mango.vim'
    Plug 'altercation/vim-colors-solarized'
    Plug 'w0ng/vim-hybrid'
    Plug 'tomasr/molokai'
    Plug 'trapd00r/neverland-vim-theme'
    " Plug 'ryanoasis/vim-devicons'
    Plug 'nanotech/jellybeans.vim'
    " {{{
      let g:jellybeans_use_term_background_color = 1
    " }}}

    Plug 'scrooloose/nerdtree'
    " {{{
      map <F2> :NERDTreeTabsToggle<CR>
    " }}}

    Plug 'groenewege/vim-less'
    Plug 'klen/python-mode'
    Plug 'jiangmiao/auto-pairs'
    " {{{
      let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
    " }}}

    Plug 'xuhdev/SingleCompile'
    " {{{
      nnoremap <F8> :SCCompile<cr>
      nnoremap <F9> :SCCompileRun<cr>
    " }}}

    " Web and template syntax and more {{{
    Plug 'plasticboy/vim-markdown'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'cakebaker/scss-syntax.vim'
    Plug 'mattn/emmet-vim'
    Plug 'jdevera/vim-stl-syntax'
    Plug 'regedarek/ZoomWin'
    Plug 'kchmck/vim-coffee-script'
    Plug 'tpope/vim-haml'
    Plug 'https://github.com/slim-template/vim-slim'
    Plug 'curist/vim-angular-template'
    Plug 'digitaltoad/vim-jade',
    Plug 'othree/yajs.vim'
    Plug 'evanmiller/nginx-vim-syntax'
    Plug 'gkz/vim-ls'
    " }}}

    " Tags {{{
    Plug 'majutsushi/tagbar'
    " {{{
    " Ctrl+] - go to definition
    " Ctrl+T - Jump back from the definition.
    " Ctrl+W Ctrl+] - Open the definition in a horizontal split
      nmap <F3> :TagbarToggle<CR>
    " }}}
    "
    "
    Plug 'xolox/vim-easytags'
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
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
    " Enable snipMate compatibility feature.
    let g:neosnippet#enable_snipmate_compatibility = 1

    " Tell Neosnippet about the other snippets
    let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

    " Ruby plugins
    Plug 'skalnik/vim-vroom'
    Plug 'vim-ruby/vim-ruby'
    Plug 'tpope/vim-rails'
    Plug 'bruno-/vim-ruby-fold'

    " Tpope utility plugins {{{
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    " Plug 'tpope/vim-env'
    " }}}

    " Other utility plugins {{{
    Plug 'mattn/webapi-vim'
    Plug 'mattn/gist-vim'
    Plug 'tejr/vim-tmux'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'xolox/vim-lua-ftplugin'
    Plug 'godlygeek/tabular'
    Plug 'easymotion/vim-easymotion'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'terryma/vim-multiple-cursors'
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
    Plug 'benekastah/neomake'
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
    Plug 'Shougo/neoinclude.vim'
    Plug 'Shougo/neomru.vim'
    Plug 'Shougo/neoyank.vim'

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
    Plug 'kana/vim-textobj-user'
    Plug 'beloglazov/vim-textobj-quotes'
    Plug 'Julian/vim-textobj-brace'
    " }}}

    call plug#end()
  " }}}
  
  " Ruby mode {{{
    let ruby_fold = 1
    " Set async completion.
    let g:monster#completion#rcodetools#backend = "async_rct_complete"

    " Set up ruby source for deoplete
    let g:deoplete#sources#omni#input_patterns = {
            \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
            \}
  " }}}
  " Python mode {{{
    " Rope AutoComplete
    let g:pymode_rope_completion = 0

    " Code checking
    let g:pymode_lint = 1
    let g:pymode_lint_unmodified = 1
    let g:pymode_lint_message = 1
    let g:pymode_lint_cwindow = 0
    let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
    let g:pymode_lint_ignore = "W0612"

    " Rope Menu
    menu Python.Create\ Package :RopeCreatePackage<CR>
    menu Python.Create\ Module :RopeCreateModule<CR>

    let g:pymode_syntax_print_as_function = 1
    let g:pymode_syntax_space_errors = 0

    let g:pymode_doc_bind = 'M'
  " }}}
  " Nerdcommenter {{{
    let NERDSpaceDelims=1
  " }}}
  " Emmet {{{
    let g:user_emmet_install_global = 0
    autocmd FileType html,css,erb EmmetInstall
  " }}}
  " Session {{{
    let g:session_autosave = 'no'
  " }}}
  " UltiSnips {{{
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsExpandTrigger = "<C-j>"
    let g:UltiSnipsJumpForwardTrigger = "<C-j>"
    let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
  " }}}
  " Session {{{
    let g:session_autoload = 'no'
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
    "
    " Use deoplete.
    let g:deoplete#enable_at_startup = 1
    " Use smartcase.
    let g:deoplete#enable_smart_case = 1

    " Start completion at 1 char
    " Depracated
    " let	g:deoplete#auto_complete_start_length = 2

    if !exists('g:deoplete#omni#input_patterns')
      let g:deoplete#omni#input_patterns = {}
    endif

    inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<TAB>"

    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return deoplete#mappings#close_popup() . "\<CR>"
    endfunction
  " }}}
  " }}}
" Mappings {{{
  " Easily scroll up/down in insert mode
  inoremap <C-b> <C-x><C-y>
  inoremap <C-f> <C-x><C-e>

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
    syntax on

    " http://terminal.sexy/ is an awesome website to create more :)
    " Other cool dark 256 color colorschemes:
    "
    " colorscheme neverland
    " let g:seoul256_background = 233
    " colo seoul256
    " airline
    let g:airline_powerline_fonts = 1
    let g:airline_theme = 'powerlineish'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:Powerline_symbols = 'fancy'
    let g:airline_exclude_filetypes=['netrw','diff','undotree','gundo','tagbar']
    let g:airline_linecolumn_prefix = ' '
    let g:airline_section_z='%3p%% '.g:airline_linecolumn_prefix.'%3l:%c'
    let g:airline_detect_whitespace=0 " turn off the whitespace extension
    "enable/disable showing a summary of changed hunks under source control.
    let g:airline#extensions#hunks#enabled = 1
    "enable/disable showing only non-zero hunks.
    let g:airline#extensions#hunks#non_zero_only = 1
    "set hunk count symbols.
    let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']

    "set tmuxline preset
    let g:tmuxline_preset = {
          \'a'    : '#S',
          \'b'    : '#W',
          \'c'    : '#H',
          \'win'  : '#I #W',
          \'cwin' : '#I #W',
          \'x'    : '%a',
          \'y'    : '#W %R',
          \'z'    : '#H'}

    
    " Thematic {{{
      " Cycle through thematic themes.
      nnoremap <Leader>t :ThematicNext<CR>

      let g:thematic#defaults = {
      \ 'colorscheme': 'molokai',
      \ }

      let g:thematic#themes = {
        \ 'jellybeans': {
        \   'colorscheme': 'jellybeans',
        \   'theme_name': 'jellybeans',
        \ },
        \ 'gruvbox_light': {
        \   'colorscheme': 'gruvbox',
        \   'theme_name': 'gruvbox_light',
        \ },
        \ 'molokai': {
        \   'colorscheme': 'molokai',
        \   'theme_name': 'molokai',
        \ },
        \ 'gruvbox_dark': {
        \   'colorscheme': 'gruvbox',
        \   'theme_name': 'gruvbox_dark',
        \ },
        \ 'hybrid': {
        \   'colorscheme': 'hybrid',
        \   'theme_name': 'hybrid',
        \ },
        \}

        let g:thematic#theme_name='molokai'
    " }}}

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
  "  Splits navigation {{{
  "  nnoremap gh <C-w>h
  "  nnoremap gj <C-w>j
  "  nnoremap gk <C-w>k
  "  nnoremap gl <C-w>l
  "" }}}
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
  " " Ruby {{{
  " "
  "   augroup ft_rb
  "     au!
  "     au FileType rb setlocal foldmethod=syntax
  "     au FileType rb setlocal expandtab
  "     au FileType rb setlocal tabstop=2 shiftwidth=2 softtabstop=2
  "     au FileType rb setlocal autoindent
  "   augroup END
  " "}}}
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
  " Django {{{
    augroup ft_django
      au!
      au BufNewFile,BufRead urls.py           setlocal nowrap
      au BufNewFile,BufRead urls.py           normal! zR
      au BufNewFile,BufRead dashboard.py      normal! zR
      au BufNewFile,BufRead local_settings.py normal! zR

      au BufNewFile,BufRead admin.py     setlocal filetype=python.django
      au BufNewFile,BufRead urls.py      setlocal filetype=python.django
      au BufNewFile,BufRead models.py    setlocal filetype=python.django
      au BufNewFile,BufRead views.py     setlocal filetype=python.django
      au BufNewFile,BufRead settings.py  setlocal filetype=python.django
      au BufNewFile,BufRead settings.py  setlocal foldmethod=marker
      au BufNewFile,BufRead forms.py     setlocal filetype=python.django
      au BufNewFile,BufRead common_settings.py  setlocal filetype=python.django
      au BufNewFile,BufRead common_settings.py  setlocal foldmethod=marker
    augroup END
  " }}}
  " Vimscript {{{
    augroup ft_viml
      au!
      au FileType vim setlocal foldmethod=marker
    augroup END
  " }}}
  " Python {{{
    augroup ft_python
      au!
      au FileType python setlocal shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
      au FileType python setlocal tabstop=4     " an hard TAB displays as 4 columns
      au FileType python setlocal expandtab     " insert spaces when hitting TABs
      au FileType python setlocal softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
      au FileType python setlocal shiftround    " round indent to multiple of 'shiftwidth'
      au FileType python setlocal autoindent    " align the new line indent with the previous line
    augroup END
  " }}}
  " PHP {{{
    augroup ft_php
      au!
      au FileType php setlocal shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
      au FileType php setlocal tabstop=4     " an hard TAB displays as 4 columns
      au FileType php setlocal expandtab     " insert spaces when hitting TABs
      au FileType php setlocal softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
      au FileType php setlocal shiftround    " round indent to multiple of 'shiftwidth'
      au FileType php setlocal autoindent    " align the new line indent with the previous line
    augroup END
  " }}}
  " CTP {{{
    augroup ft_ctp
      au!
      au FileType ctp setlocal shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
      au FileType ctp setlocal tabstop=4     " an hard TAB displays as 4 columns
      au FileType ctp setlocal expandtab     " insert spaces when hitting TABs
      au FileType ctp setlocal softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
      au FileType ctp setlocal shiftround    " round indent to multiple of 'shiftwidth'
      au FileType ctp setlocal autoindent    " align the new line indent with the previous line
    augroup END
  " }}}
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
  " Jade {{{
    augroup ft_jade
      au!
      au FileType jade setlocal nofoldenable
      au FileType jade setlocal shiftwidth=2
      au FileType jade setlocal tabstop=2
      au FileType jade setlocal expandtab
      au FileType jade setlocal softtabstop=2
      au FileType jade setlocal shiftround
    augroup END
  " }}}
  " Markdown {{{
    augroup ft_mkd
      au!
      au FileType mkd setlocal textwidth=80
      au FileType mkd nnoremap <buffer> <leader><space> :Goyo<CR>
    augroup END
  " }}}
  " reStructuredText {{{
    augroup ft_rst
      au!
      au FileType rst setlocal textwidth=79
      au FileType rst setlocal colorcolumn=80
      au FileType rst nnoremap <buffer> <leader><space> :Goyo<CR>
    augroup END
  " }}}
  " LaTeX {{{
    augroup ft_tex
      au!
      au FileType tex setlocal textwidth=80
      au FileType tex setlocal foldmethod=manual
    augroup END
  " }}}
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
  " Lua {{{
    augroup ft_lua
      au!
      au FileType lua setlocal foldmethod=marker
      au FileType lua setlocal shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
      au FileType lua setlocal tabstop=4     " an hard TAB displays as 4 columns
      au FileType lua setlocal expandtab     " insert spaces when hitting TABs
      au FileType lua setlocal softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
      au FileType lua setlocal shiftround    " round indent to multiple of 'shiftwidth'
      au FileType lua setlocal autoindent    " align the new line indent with the previous line
    augroup END
  " }}}
  " Nonvim {{{
    augroup nonvim
      au BufRead *.png,*.jpg,*.pdf,*.gif,*.xls*,*.scpt sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!
    augroup END
  " }}}
" }}}

" GUI settings {{{
  if has('gui_running')
    set guifont=Monaco\ for\ Powerline\ 10
    set guioptions-=T
    set guioptions-=m
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
  else
    set mouse=a
  endif
" }}}
filetype plugin indent on
