if executable('/usr/bin/rg')
  call denite#custom#var('file_rec', 'command', ['/usr/bin/rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading', '--ignore-case'])
else
  call denite#custom#var('file_rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

call denite#custom#map('insert', '<C-h>', '<denite:move_to_first_line>', 'noremap')
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-l>', '<denite:move_to_last_line>', 'noremap')

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

