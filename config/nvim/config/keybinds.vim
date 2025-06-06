" Make your keyboard actually do something when you switch to Cyrillic layout.
" Basically map Bulgarian keychords to English ones in vim.
set langmap+=чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю\|,

" Map the leader keys
let mapleader=","
let maplocalleader="\\"

" Mappings
" Easily scroll up/down in insert mode
inoremap <C-b> <C-x><C-y>
inoremap <C-f> <C-x><C-e>

" Expand current path with %%
cnoremap <expr> %% expand('%:h').'/'

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Insert a pipe |> with <c-k>
imap <c-k> <bar>><space>

"call Dispatch
nnoremap <leader>d :Dispatch<space>

"call Dispatch Start
nnoremap <leader>ds :Start<space>

" Close  but Current
nnoremap <leader>cc :only<CR>

" puts the caller
nnoremap <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>
nnoremap <leader>pdb oimport pdb<c-m>pdb.set_trace()<esc>
" nmap <silent> <leader>t :w<CR>\|:TestNearest<CR>
" nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>

if has("nvim")
  " Terminal mode maps
  tnoremap <Esc> <C-\><C-n>

  " Moving around in the terminal buffer
  " tnoremap <C-h> <C-\><C-n><C-w>h
  " tnoremap <C-j> <C-\><C-n><C-w>j
  " tnoremap <C-k> <C-\><C-n><C-w>k
  " tnoremap <C-l> <C-\><C-n><C-w>l

  " Run test in terminal
  " tnoremap <silent> <leader>t :w<CR>\|:TestNearest<CR>
  " tnoremap <silent> <leader>T :TestFile<CR>
  " tnoremap <silent> <leader>a :TestSuite<CR>
  " tnoremap <silent> <leader>l :TestLast<CR>
  " tnoremap <silent> <leader>g :TestVisit<CR>
endif

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
noremap <silent> <Leader>w :update<CR>
noremap <silent> <Leader>wq :x<CR>
noremap <silent> <Leader>q :quit<CR>
noremap <silent> <Leader>qq :quit!<CR>
noremap <silent> <Leader>ss :split<CR>
noremap <silent> <Leader>vv :vsplit<CR>

" Paste in the next line.
nnoremap <leader>p o<ESC>p

:map <leader>p :PromoteToLet<CR>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Switching between tabs
nnoremap K :tabn<CR>
nnoremap J :tabp<CR>

" Enable up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Easily go to the beginning/end of the line
noremap H ^
noremap L $
vnoremap L g_

" CtrlSF setup
nnoremap <Leader>sf :CtrlSF<Space>
nnoremap <Leader>st :CtrlSF<Space>-filematch<Space>*ex<Space>

" FZF
" nnoremap <space>b :Buffers<CR>
" nnoremap <space>l :Lines<CR>
" nnoremap <space>bc :Commits<CR>
" nnoremap <space>bs :GFiles?<CR>

" Neoterm
" Term file
nnoremap <silent> <space>tf :TREPLSendFile<CR>
" Term line
nnoremap <silent> <space>tl :TREPLSendLine<CR>
" Term line selection
vnoremap <silent> <space>tl :TREPLSendSelection<CR>

" Useful maps
" hide/close terminal
nnoremap <silent> <space>th :Tclose<CR>
" open terminal
nnoremap <silent> <space>to :Topen<CR>
nnoremap <silent> <space>tro :belowright Topen<CR>

nnoremap <silent> <space>tn :Tnew<CR>
nnoremap <silent> <space>trn :belowright Tnew<CR>
" clear terminaj
nnoremap <silent> <space>tl :call neoterm#clear()<CR>
" kills the current job (send a <c-c>)
nnoremap <silent> <space>tc :call neoterm#kill()<CR>

" Tabularize Align
vnoremap <Leader>a :Tabularize /

" Resizing splits with arrows
nnoremap <left>  <c-w><
nnoremap <right> <c-w>>
nnoremap <up>    <c-w>-
nnoremap <down>  <c-w>+

" Edit vimrc
nnoremap <leader>ev :tabedit $MYVIMRC<CR>

" Edit tmux.conf
nnoremap <leader>et :tabedit ~/.tmux.conf<CR>

" Edit fish config
nnoremap <leader>ef :tabedit ~/.config/fish/config.fish<CR>

" Clear search highlights
noremap <silent><Leader>/ :nohls<CR>

" Don't jump to the next match when * is pressed
nnoremap * *``

" Centers the screen on searching
nnoremap n nzzzv
nnoremap N Nzzzv

" Searching
" Use perl regexes.
nnoremap / /\v
vnoremap / /\v

nnoremap <F2> :NERDTreeToggle<CR>

nmap <leader>ale :ALEToggle<CR>

" Use CamelCaseMotion instead of default motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Git binds
map <leader>gw :!git add . && git commit -m "WIP" && git push<CR>
map <leader>gs :Gstatus<CR>
map <leader>gb :Gblame<CR>

" Write using `sudo` in COMMAND mode if the file is read-only.
cnoremap w!! w !sudo tee % >/dev/null

" When in Bulgarian layout
cnoreabbrev в w
cnoreabbrev В w
cnoreabbrev я q
cnoreabbrev яа qа
cnoreabbrev яал qаl
cnoreabbrev яалл qаll

nnoremap й gj
nnoremap к gk

nnoremap <leader>en :e _Notes.md<CR>
nnoremap <leader>et :e _TODO.md<CR>

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <buffer> <leader>doc o@doc """<c-m>Documentation<c-m>"""<esc>kviw
