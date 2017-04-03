call denite#custom#var('file_rec', 'command',
  \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

let s:denite_options = {'default' : {
  \ 'winheight' : 10,
  \ 'mode' : 'insert',
  \ 'quit' : 'true',
  \ 'highlight-matched-char' : 'Function',
  \ 'highlight-matched-range' : 'Function',
  \ 'direction': 'rightbelow',
  \ 'statusline' : 'false',
  \ 'prompt' : '➭',
  \ }}

function! s:profile(opts) abort
  for fname in keys(a:opts)
    for dopt in keys(a:opts[fname])
      call denite#custom#option(fname, dopt, a:opts[fname][dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)

