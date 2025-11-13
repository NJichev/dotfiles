-- Native LSP Configuration using vim.lsp.enable()
-- This requires Neovim 0.11+

-- Set LSP log level for debugging
vim.lsp.set_log_level("debug")

-- Load and register language server configurations
-- Each server configuration is stored in lua/lsp/{server_name}.lua
local servers = {
  "expert",        -- Expert language server (for Elixir)
  "lua_ls",        -- Lua Language Server
  "pyright",       -- Python
  "ts_ls",         -- TypeScript/JavaScript
  "rust_analyzer", -- Rust
  "gopls",         -- Go
}

-- Register each server configuration with vim.lsp.config
for _, server_name in ipairs(servers) do
  local ok, config = pcall(require, 'lsp.' .. server_name)
  if ok then
    -- Register the configuration so vim.lsp.enable() can find it
    vim.lsp.config(server_name, config)
  else
    -- Only show errors if a config fails to load
    vim.notify("Failed to load LSP config: " .. server_name .. "\n" .. config, vim.log.levels.ERROR)
  end
end

-- Enable all registered servers
vim.lsp.enable(servers)

-- Create a custom :LspInfo command for native LSP
vim.api.nvim_create_user_command('LspInfo', function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  
  if #clients == 0 then
    print("No LSP clients attached to current buffer")
    print("\nAll running LSP clients:")
    local all_clients = vim.lsp.get_clients()
    for _, client in ipairs(all_clients) do
      print(string.format("  - %s (id: %d)", client.name, client.id))
    end
    return
  end
  
  print("LSP clients attached to buffer:")
  for _, client in ipairs(clients) do
    print(string.format("  - %s (id: %d)", client.name, client.id))
    print(string.format("    root_dir: %s", client.root_dir or "N/A"))
    print(string.format("    filetypes: %s", table.concat(client.config.filetypes or {}, ", ")))
  end
end, {})

-- Command to view LSP log
vim.api.nvim_create_user_command('LspLog', function()
  vim.cmd.edit(vim.lsp.get_log_path())
end, {})

-- Command to manually start expert for debugging
vim.api.nvim_create_user_command('LspStartExpert', function()
  local config = require('lsp.expert')
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.start(config, { bufnr = bufnr })
  print("Attempted to start expert LSP for current buffer")
end, {})

-- Command to check which servers are enabled
vim.api.nvim_create_user_command('LspEnabled', function()
  print("Enabled LSP servers:")
  for _, server in ipairs(servers) do
    print("  - " .. server)
  end
end, {})

-- Configure diagnostics display
vim.diagnostic.config({
  virtual_lines = true,
  -- virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})

-- Optional: Configure LSP handlers for better UI
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "rounded",
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = "rounded",
  }
)
