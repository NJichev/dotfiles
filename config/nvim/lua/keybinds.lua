-- Keybindings

-- Helper function to set keymaps more concisely
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Make your keyboard actually do something when you switch to Cyrillic layout.
-- Basically map Bulgarian keychords to English ones in vim.
vim.opt.langmap = 'чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\\\,Ю|'

-- INSERT MODE MAPPINGS
-- Easily scroll up/down in insert mode
map('i', '<C-b>', '<C-x><C-y>')
map('i', '<C-f>', '<C-x><C-e>')

-- Insert a hash rocket with <c-l>
map('i', '<c-l>', ' => ', { noremap = true, silent = false })

-- Insert a pipe |> with <c-k>
map('i', '<c-k>', '|> ', { noremap = true, silent = false })

-- Because the Esc key is too far...
map('i', 'jk', '<Esc>')

-- Change keyboard layouts
map('i', '<C-z>', '<C-^>')

-- NORMAL MODE MAPPINGS
-- Close all but Current
map('n', '<leader>cc', ':only<CR>')

-- Puts the caller (debugging helpers)
map('n', '<leader>wtf', 'oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>', { noremap = true, silent = false })
map('n', '<leader>pdb', 'oimport pdb<c-m>pdb.set_trace()<esc>', { noremap = true, silent = false })

-- Format current paragraph (Ex-mode sucks...)
map('n', 'Q', 'gwip')

-- Select the whole line without the indentation. Useful for python code...
map('n', 'vv', '^vg_')

-- Leader commands
map('n', '<Leader>w', ':update<CR>')
map('n', '<Leader>wq', ':x<CR>')
map('n', '<Leader>q', ':quit<CR>')
map('n', '<Leader>qq', ':quit!<CR>')
map('n', '<Leader>ss', ':split<CR>')
map('n', '<Leader>vv', ':vsplit<CR>')

-- Promote to let
map('n', '<leader>p', ':PromoteToLet<CR>')

-- Switching between tabs
map('n', 'K', ':tabn<CR>')
map('n', 'J', ':tabp<CR>')

-- Enable up/down movement on wrapped lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')
map('x', 'j', 'gj')
map('x', 'k', 'gk')

-- Easily go to the beginning/end of the line
map('n', 'H', '^')
map('n', 'L', '$')
map('v', 'H', '^')
map('v', 'L', 'g_')

-- CtrlSF setup
map('n', '<Leader>sf', ':CtrlSF ', { silent = false })
map('n', '<Leader>st', ':CtrlSF -filematch *ex ', { silent = false })

-- Neoterm
-- Term file
map('n', '<space>tf', ':TREPLSendFile<CR>')
-- Term line
map('n', '<space>tl', ':TREPLSendLine<CR>')
-- Term line selection
map('v', '<space>tl', ':TREPLSendSelection<CR>')

-- Useful maps
-- hide/close terminal
map('n', '<space>th', ':Tclose<CR>')
-- open terminal
map('n', '<space>to', ':Topen<CR>')
map('n', '<space>tro', ':belowright Topen<CR>')

map('n', '<space>tn', ':Tnew<CR>')
map('n', '<space>trn', ':belowright Tnew<CR>')
-- clear terminal
map('n', '<space>tc', ':call neoterm#clear()<CR>')
-- kills the current job (send a <c-c>)
map('n', '<space>tk', ':call neoterm#kill()<CR>')

-- Resizing splits with arrows
map('n', '<left>', '<c-w><')
map('n', '<right>', '<c-w>>')
map('n', '<up>', '<c-w>-')
map('n', '<down>', '<c-w>+')

-- Edit vimrc
map('n', '<leader>ev', ':tabedit $MYVIMRC<CR>')

-- Edit fish config
map('n', '<leader>ef', ':tabedit ~/.config/fish/config.fish<CR>')

-- Clear search highlights
map('n', '<Leader>/', ':nohls<CR>')

-- Don't jump to the next match when * is pressed
map('n', '*', '*``')

-- Centers the screen on searching
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Searching - Use perl regexes
map('n', '/', '/\\v', { silent = false })
map('v', '/', '/\\v', { silent = false })

-- NERDTree toggle
map('n', '<F2>', ':NERDTreeToggle<CR>')

-- Use CamelCaseMotion instead of default motions
map('', 'w', '<Plug>CamelCaseMotion_w', { noremap = false })
map('', 'b', '<Plug>CamelCaseMotion_b', { noremap = false })
map('', 'e', '<Plug>CamelCaseMotion_e', { noremap = false })
map('', 'ge', '<Plug>CamelCaseMotion_ge', { noremap = false })
-- Unmap for select mode
vim.keymap.del('s', 'w')
vim.keymap.del('s', 'b')
vim.keymap.del('s', 'e')
vim.keymap.del('s', 'ge')

-- Git binds
map('n', '<leader>gw', ':!git add . && git commit -m "WIP" && git push<CR>', { noremap = true, silent = false })
map('n', '<leader>gs', ':Git<CR>')
map('n', '<leader>gb', ':Git blame<CR>')

-- Edit notes
map('n', '<leader>en', ':e _Notes.md<CR>')
map('n', '<leader>et', ':e _TODO.md<CR>')

-- Substitute word under cursor
map('n', '<Leader>s', ':%s/\\<<C-r><C-w>\\>//g<Left><Left>', { silent = false })

-- VISUAL MODE MAPPINGS
-- Reselect visual block after indent/outdent
map('v', '<', '<gv')
map('v', '>', '>gv')

-- COMMAND MODE MAPPINGS
-- Expand current path with %%
vim.keymap.set('c', '%%', function() return vim.fn.expand('%:h') .. '/' end, { expr = true })

-- Change keyboard layouts
map('c', '<C-z>', '<C-^>')

-- Sudo to write
map('c', 'w!!', 'w !sudo tee % >/dev/null', { noremap = true, silent = false })

-- Bulgarian layout command abbreviations
vim.cmd([[
cnoreabbrev в w
cnoreabbrev В w
cnoreabbrev я q
cnoreabbrev яа qа
cnoreabbrev яал qаl
cnoreabbrev яалл qаll
]])

-- Bulgarian layout normal mode
map('n', 'й', 'gj')
map('n', 'к', 'gk')

-- TERMINAL MODE MAPPINGS
-- Terminal mode escape
map('t', '<Esc>', '<C-\\><C-n>')
