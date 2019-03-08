" Renaming
set hidden

let g:LanguageClient_rootMarkers = {
    \ 'elixir': ['mix.exs'],
    \ }

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'haskell': ['hie', '--lsp'],
    \ 'cpp': ['/usr/bin/cquery', '--log-file=/tmp/cq.log'],
    \ 'c': ['/usr/bin/cquery', '--log-file=/tmp/cq.log'],
    \ 'elixir': ['/home/njichev/Projects/elixir-ls/rel/language_server.sh'],
    \ 'ruby': ['/home/njichev/.asdf/shims/solargraph', 'socket'],
    \ }

let g:LanguageClient_hasSnippetSupport = 0
let g:LanguageClient_useVirtualText = 1
