" Gutentags
let g:gutentags_ctags_tagfile='.tags'
"
" Use ripper-tags to generate tags for Ruby.
let g:gutentags_ctags_executable_ruby='ripper-tags'
let g:gutentags_ctags_exclude = [
    \ '*.min.js',
    \ '*html*',
    \ 'jquery*.js',
    \ '*/vendor/*',
    \ '*/node_modules/*',
    \ '*/python2.7/*',
    \ '*/migrate/*.rb'
    \ ]

let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_write = 1
