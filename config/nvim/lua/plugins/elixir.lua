return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")
    local nextls_opts

    if vim.env.NEXTLS_LOCAL == "1" then
      nextls_opts = {
        enable = true,
        port = 9000,
        spitfire = false,
        init_options = {
          experimental = {
            completions = {
              enable = true,
            },
          },
        },
      }
    else
      nextls_opts = {
        enable = true,
        spitfire = false,
        init_options = {
          experimental = {
            completions = {
              enable = true,
            },
          },
        },
      }
    end
    elixir.setup {
      nextls = nextls_opts,
      credo = { enable = false },
      elixirls = {
        enable = false,
        settings = elixirls.settings {
          dialyzerEnabled = false,
          enableTestLenses = false,
        },
        on_attach = function(client, bufnr)
          vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          vim.keymap.set("v", "<space>ar", ":Elixir nextls alias-refactor<cr>", { buffer = true, noremap = true })
        end,
      }
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
