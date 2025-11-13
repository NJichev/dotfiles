-- Native LSP Configuration using vim.lsp.enable()
-- This requires Neovim 0.11+

-- Enable all configured language servers
-- Each server configuration is stored in lua/lsp/{server_name}.lua
local servers = {
  "expert",      -- Custom expert language server (for Lua)
  "lua_ls",      -- Lua Language Server
  "pyright",     -- Python
  "ts_ls",       -- TypeScript/JavaScript
  "rust_analyzer", -- Rust
  "gopls",       -- Go
}

vim.lsp.enable(servers)

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
