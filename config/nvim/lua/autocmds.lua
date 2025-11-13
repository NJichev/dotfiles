-- LSP Attach autocmd
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F3>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
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
  callback = function()
    local file = vim.fn.shellescape(vim.fn.expand('%:p'))
    vim.cmd('silent! !xdg-open ' .. file)
    vim.cmd('bdelete')
    vim.cmd('redraw!')
  end
})

-- Resize splits when window is resized
vim.api.nvim_create_autocmd('VimResized', {
  pattern = '*',
  callback = function()
    vim.cmd('normal! \\<c-w>=')
  end
})
