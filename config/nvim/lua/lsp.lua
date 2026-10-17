-- Server configs live in lsp/<name>.lua and are picked up by vim.lsp.config.
-- Servers that aren't installed are skipped. Check status with :checkhealth vim.lsp
vim.lsp.log.set_level("warn")

vim.lsp.enable({
  "expert",        -- Elixir
  "lua_ls",        -- Lua
  "pyright",       -- Python
  "ts_ls",         -- TypeScript/JavaScript
  "rust_analyzer", -- Rust
  "gopls",         -- Go
})

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
})

-- elixir-tools can keep expert from auto-starting, so start it if it's missing
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "elixir", "eelixir", "heex" },
  callback = function(args)
    vim.defer_fn(function()
      local config = vim.lsp.config.expert
      if #vim.lsp.get_clients({ bufnr = args.buf, name = "expert" }) == 0
          and vim.fn.executable(config.cmd[1]) == 1 then
        vim.lsp.start(config, { bufnr = args.buf })
      end
    end, 100)
  end,
})

vim.api.nvim_create_user_command("LspLog", function()
  vim.cmd.tabedit(vim.lsp.log.get_filename())
end, {})
