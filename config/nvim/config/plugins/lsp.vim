" Renaming
" set hidden

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'haskell': ['hie', '--lsp'],
    \ 'elixir': ['/home/njichev/Projects/elixir-ls/language_server.sh'],
    \ }

let g:LanguageClient_hasSnippetSupport = 0
