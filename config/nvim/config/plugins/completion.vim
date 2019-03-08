let g:ale_enabled = 1
let g:ale_completion_enabled = 0
let g:ale_lint_delay = 200
let g:ale_echo_msg_format = '[%linter%] %s'
" disabling linters where language servers are installed/available..
let g:ale_linters = {
      \   'elixir': ['elixir-ls'],
      \   'eelixir': ['elixir-ls'],
      \   'ex': ['elixir-ls'],
      \   'exs': ['elixir-ls'],
      \ }
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['prettier_eslint'],
      \   'javascript.jsx': ['prettier_eslint'],
      \   'css': ['prettier'],
      \   'scss': ['prettier'],
      \   'json': ['prettier'],
      \   'elm': ['elm-format'],
      \   'elixir': ['mix_format'],
      \   'eelixir': ['mix_format'],
      \ }                                                                       "Fix eslint errors
let g:ale_sign_error = '✖'                                                      "Lint error sign ⤫ ✖⨉
let g:ale_sign_warning = '⬥'                                                    "Lint warning sign ⬥⚠
let g:ale_sign_info = '‣'
let g:ale_elixir_elixir_ls_release ="/home/njichev/Projects/elixir-ls/rel"
let b:ale_elixir_elixir_ls_config = {'elixirLS': {'dialyzerEnabled': v:true, 'projectDir': expand($PWD)}}
let g:ale_lint_on_text_changed = 'always' " 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = "❯❯ "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" if hidden not set, TextEdit might fail.
set hidden

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` for navigate diagnostics

nmap <silent> <space>d <Plug>(coc-diagnostic-info)
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

set formatexpr=CocActionAsync('formatSelected')
" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
augroup CocAu
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd CursorHoldI,CursorMovedI * call CocActionAsync('showSignatureHelp')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END
autocmd FileType json syntax match Comment +\/\/.\+$+
