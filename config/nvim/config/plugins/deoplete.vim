" let g:python3_host_prog = "/usr/sbin/python"

let g:python_host_prog = "/home/njichev/.virtualenvs/neovim2/bin/python"
let g:python3_host_prog = "/home/njichev/.virtualenvs/neovim3/bin/python"

"some ruby stuff
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_load_gemfile = 1

" Deoplete

let g:deoplete#enable_at_startup = 1

" With deoplete.nvim
let g:monster#completion#rcodetools#backend = "async_rct_complete"

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.ruby = 'rubycomplete#Complete'

let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

let g:deoplete#enable_refresh_always=1
let g:deoplete#file#enable_buffer_path=1
let g:deoplete#auto_complete_start_length=1

let g:deoplete#sources={}
let g:deoplete#sources._    = ['buffer', 'file', 'ultisnips']
let g:deoplete#sources.ruby = ['buffer', 'member', 'file', 'ultisnips', 'omnifunc']
let g:deoplete#sources.vim  = ['buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources['javascript.jsx'] = ['buffer', 'file', 'ultisnips', 'ternjs']
let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.scss = ['buffer', 'member', 'file', 'omni', 'ultisnips']
" let g:deoplete#disable_auto_complete = 1
"
" inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : deoplete#mappings#manual_complete()
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
