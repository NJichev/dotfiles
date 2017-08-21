" Make your keyboard actually do something when you switch to Cyrillic layout. 
" Basically map Bulgarian keychords to English ones in vim.
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
nnoremap <leader>. :OpenTestAlternate<cr>

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Insert a triangle (|>) with <c-.>(it's too awkward to write)
" Apparently vim cant map c-. since . and c-. is the same thing for it
" I guess we will use something else like <c-k>
imap <c-k> <bar>><space>

"call Dispatch
nnoremap <leader>d :Dispatch<space>

"call Dispatch Start
nnoremap <leader>ds :Start<space>

" Close  but Current
nnoremap <leader>cc :only<cr>

" puts the caller
nnoremap <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>

nmap <silent> <leader>t :w<cr>\|:TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
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

" Dirty tmux integration
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" CtrlSF setup
nnoremap <Leader>sf :CtrlSF<Space>

" FZF
nnoremap <space>f :Files<cr>
nnoremap <space>b :Buffers<cr>
nnoremap <space>bl :Lines<cr>
nnoremap <space>bc :Commits<cr>
nnoremap <space>bs :GFiles?<cr>

nnoremap <space>fam :FZF app/models<cr>
nnoremap <space>fac :FZF app/controllers<cr>
nnoremap <space>fah :FZF app/helpers<CR>
nnoremap <space>fas :FZF spec<CR>
nnoremap <space>fat :FZF test<CR>
nnoremap <space>fav :FZF app/views<CR>
nnoremap <space>fal :FZF lib/<cr>

" Neoterm
" Term file
nnoremap <silent> <space>tf :TREPLSendFile<cr>
" Term line
nnoremap <silent> <space>tl :TREPLSendLine<cr>
" Term line selection
vnoremap <silent> <space>tl :TREPLSendSelection<cr>

" Useful maps
" hide/close terminal
nnoremap <silent> <space>th :Tclose<cr>
" open terminal
nnoremap <silent> <space>to :Topen<cr>
" clear terminal
nnoremap <silent> <space>tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> <space>tc :call neoterm#kill()<cr>
nnoremap <silent> <space>trc :T rails console<cr>
nnoremap <silent> <space>trs :T rails server<cr>
nnoremap <silent> <space>tbi :T bundle install<cr>
nnoremap <silent> <space>trr :T rake routes<cr>

" Tabularize Align
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

map <F2> :NERDTreeToggle<CR>

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
map <leader>gw :!git add . && git commit -m "WIP" && git push<cr>
map <leader>gs :Gstatus<cr>
map <leader>gb :Gblame<cr>

" Write using `sudo` in COMMAND mode if the file is read-only.
" Ripped off @StanAngeloff.
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
