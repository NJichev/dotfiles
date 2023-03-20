return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "<CurrentMajor>.*",
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  { "rafamadriz/friendly-snippets" },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      local lsp_defaults = lspconfig.util.default_config

      lsp_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lsp_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
      )

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "tailwindcss" },
      })

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
              unusedLocalExclude = { "_*" },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      })

      lspconfig.elixirls.setup{
          cms = { "~/Projects/elixir-ls/release/language_server.sh" },
          dialyzerEnabled = false
      }

      lspconfig.tailwindcss.setup({
        userLanguages = {
          elixir = "phoenix-heex",
          eruby = "erb",
          heex = "phoenix-heex",
        },
      })

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
    end,
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    }
  },
}
