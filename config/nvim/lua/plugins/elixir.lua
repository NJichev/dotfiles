vim.pack.add({
  { src = "https://github.com/elixir-tools/elixir-tools.nvim", version = vim.version.range("*") },
  "https://github.com/nvim-lua/plenary.nvim",
}, { confirm = false })

-- elixir-tools runs Next LS; expert runs through native LSP (lsp/expert.lua)
require("elixir").setup({
  nextls = {
    enable = true,
    -- NEXTLS_LOCAL=1 connects to a Next LS you're running yourself on port 9000
    port = vim.env.NEXTLS_LOCAL == "1" and 9000 or nil,
    spitfire = false,
    init_options = {
      experimental = {
        completions = { enable = true },
      },
    },
  },
  expert = { enable = false },
  credo = { enable = false },
  elixirls = { enable = false },
})
