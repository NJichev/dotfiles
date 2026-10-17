-- LSP keymaps (Neovim also has built-in ones: grn, gra, grr, gri, gO, K)
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(args)
    local bufmap = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = args.buf })
    end

    bufmap('n', 'K', vim.lsp.buf.hover)
    bufmap('n', 'gd', vim.lsp.buf.definition)
    bufmap('n', 'gD', vim.lsp.buf.declaration)
    bufmap('n', 'gi', vim.lsp.buf.implementation)
    bufmap('n', 'go', vim.lsp.buf.type_definition)
    bufmap('n', 'gr', vim.lsp.buf.references)
    bufmap('n', 'gs', vim.lsp.buf.signature_help)
    bufmap('n', '<F3>', vim.lsp.buf.rename)
    bufmap({ 'n', 'x' }, '<F4>', vim.lsp.buf.code_action)
    bufmap('n', 'gl', vim.diagnostic.open_float)
    bufmap('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end)
    bufmap('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end)
    bufmap('n', '<leader>lr', '<cmd>lsp restart<cr>')
  end
})

-- Filetype specific settings
vim.api.nvim_create_autocmd('Filetype', {
  pattern = 'c',
  callback = function()
    vim.opt_local.tabstop = 8
    vim.opt_local.shiftwidth = 8
    vim.opt_local.expandtab = false
  end
})

vim.api.nvim_create_autocmd('Filetype', {
  pattern = 'elixir',
  callback = function()
    vim.opt_local.formatprg = 'mix format -'
    -- Elixir doc template
    vim.keymap.set('n', '<leader>doc', 'o@doc """<c-m>Documentation<c-m>"""<esc>kviw', { buffer = true })
  end
})

vim.api.nvim_create_autocmd('Filetype', {
  pattern = 'gitcommit',
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.textwidth = 72
  end
})

-- Set prolog filetype for .pl files
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*.pl',
  callback = function()
    vim.bo.filetype = 'prolog'
  end
})

-- Set textwidth for markdown files
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.md',
  callback = function()
    vim.opt_local.textwidth = 72
  end
})

-- Open files with last cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd('normal! g`"')
    end
  end
})

-- Open pictures and other files with external programs
vim.api.nvim_create_augroup('nonvim', { clear = true })
vim.api.nvim_create_autocmd('BufRead', {
  group = 'nonvim',
  pattern = { '*.png', '*.jpg', '*.pdf', '*.gif', '*.xls*', '*.scpt' },
  callback = function(args)
    vim.ui.open(vim.api.nvim_buf_get_name(args.buf))
    vim.cmd('bdelete')
  end
})

-- Resize splits when window is resized
vim.api.nvim_create_autocmd('VimResized', {
  pattern = '*',
  command = 'wincmd =',
})
