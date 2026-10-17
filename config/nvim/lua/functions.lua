-- Custom functions

-- Custom test run strategy
local function split_strategy(cmd)
  vim.cmd('botright new')
  vim.cmd('resize 15')
  vim.fn.jobstart(cmd, { term = true })
  vim.cmd('startinsert')
end

-- Promote to let
local function promote_to_let()
  vim.cmd('normal! dd')
  vim.cmd('normal! P')
  vim.cmd([[.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/]])
  vim.cmd('normal ==')
end

-- Create the command
vim.api.nvim_create_user_command('PromoteToLet', promote_to_let, { bang = true })

-- FZF Find command
vim.api.nvim_create_user_command('Find', function(opts)
  local args = opts.args
  require('fzf-lua').grep({
    search = args,
    rg_opts = '--column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color=always',
  })
end, { nargs = '*' })

-- Inline Variable function
local function inline_variable()
  -- Copy the variable under the cursor into the 'a' register
  local tmp_a = vim.fn.getreg('a')
  vim.cmd('normal "ayiw')
  
  -- Delete variable and equals sign
  vim.cmd('normal 2daW')
  
  -- Delete the expression into the 'b' register
  local tmp_b = vim.fn.getreg('b')
  vim.cmd('normal "bd$')
  
  -- Delete the remnants of the line
  vim.cmd('normal dd')
  
  -- Go to the end of the previous line
  vim.cmd('normal k$')
  
  -- Find the next occurrence of the variable
  local var_name = vim.fn.getreg('a')
  vim.cmd('/' .. [[\<]] .. var_name .. [[\>]])
  
  -- Replace that occurrence with the text we yanked
  local replacement = vim.fn.getreg('b')
  -- Escape forward slashes for substitution
  replacement = replacement:gsub('/', '\\/')
  vim.cmd([[.s/\<]] .. var_name .. [[\>/]] .. replacement)
  
  -- Restore original registers
  vim.fn.setreg('a', tmp_a)
  vim.fn.setreg('b', tmp_b)
end

-- Export functions if needed elsewhere
return {
  split_strategy = split_strategy,
  promote_to_let = promote_to_let,
  inline_variable = inline_variable,
}

