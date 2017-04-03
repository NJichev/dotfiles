" Make you keyboard actually do something while you are switched to Cyrillic
" layout. Basically map bulgarian keychords to english ones in vim.
set langmap+=чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю\|,

" Map the leader keys
let mapleader=","
let maplocalleader="\\"

" Insert <TAB> or select next match
inoremap <silent> <expr> <Tab> utils#tabComplete()

" Mappings
" Easily scroll up/down in insert mode
inoremap <C-b> <C-x><C-y>
inoremap <C-f> <C-x><C-e>

" Expand current path with %%
cnoremap <expr> %% expand('%:h').'/'

" Try to open spec file for current file
nnoremap <leader>. :call OpenTestAlternate()<cr>

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Insert a triangle (|>) with <c-.>(it's too awkward to write)
" Apparently vim cant map c-. since . and c-. is the same thing for it
" I guess we will use something else like <c-k>
imap <c-k> <bar>><space>

" Call dispatch
nnoremap <leader>d :Dispatch<space>
nnoremap <leader>ds :Start<space>

" Close quickfix
nnoremap <leader>cc :cclose<cr>

" puts the caller
nnoremap <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>

nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

if has("nvim")
  " Terminal mode maps
  tnoremap <Esc> <C-\><C-n>
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
noremap <Leader>w :update<CR>
noremap <Leader>wq :x<CR>
noremap <Leader>q :quit<CR>
noremap <Leader>qq :quit!<CR>
noremap <Leader>ss :split<CR>
noremap <Leader>vv :vsplit<CR>

" Paste in the next line.
nnoremap <leader>p o<ESC>p

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

" Denite setup
nnoremap <Leader>f :Denite file_rec<CR>

" Tabularize Aligh
vnoremap <Leader>a :Tabularize /


" Resizing splits with arrows
nnoremap <left>  <c-w><
nnoremap <right> <c-w>>
nnoremap <up>    <c-w>-
nnoremap <down>  <c-w>+

" Edit vimrc
nnoremap <leader>ev :tabedit $MYVIMRC<cr>

" Edit tmux.conf
nnoremap <leader>et :tabedit ~/.tmux.conf<cr>

" Edit fish config
nnoremap <leader>ef :tabedit ~/.config/fish/config.fish<cr>
