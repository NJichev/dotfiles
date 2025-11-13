-- Expert LSP for Elixir
return {
  name = "expert",
  cmd = {
    "/Users/njichev/Projects/expert/apps/expert/burrito_out/expert_darwin_arm64",
    "--stdio",
  },
  filetypes = {
    "elixir",
    "eelixir", 
    "heex",
  },
  root_markers = {
    "mix.exs",
    ".git",
  },
  root_dir = function(fname)
    local util = vim.fs
    return util.root(fname, { "mix.exs", ".git" })
  end,
  settings = {},
  log_level = vim.lsp.protocol.MessageType.Info, -- Set to Info to see more logs
}
