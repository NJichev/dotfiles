" Renaming
" set hidden

let g:LanguageClient_rootMarkers = {
    \ 'elixir': ['mix.exs'],
    \ }

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'haskell': ['hie', '--lsp'],
    \ 'elixir': ['/home/njichev/Projects/elixir-ls/language_server.sh'],
    \ 'cpp': ['/usr/bin/cquery', '--log-file=/tmp/cq.log'],
    \ 'c': ['/usr/bin/cquery', '--log-file=/tmp/cq.log'],
    \ 'ruby': ['/home/njichev/.asdf/shims/solargraph', 'socket'],
    \ }

let g:LanguageClient_hasSnippetSupport = 0
