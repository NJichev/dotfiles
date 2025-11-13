-- Rust Analyzer Language Server configuration
return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = {
    ".git",
    "Cargo.toml",
    "Cargo.lock",
  },
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
}

