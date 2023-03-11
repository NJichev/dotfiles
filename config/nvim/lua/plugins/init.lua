return {
  {
    -- Start the theme first so that any 
    "ellisonleao/gruvbox.nvim",
    priority = 1000
  },
  "christoomey/vim-tmux-navigator",
  "bkad/CamelCaseMotion",
  {
    "kassio/neoterm",
  },
  {
    "vim-test/vim-test",
    keys = {
      {"<leader>T", "<cmd>TestFile<cr>", "n", "<silent>"},
      {"<leader>a", "<cmd>TestSuite<cr>", "n", "<silent>"},
      {"<leader>l", "<cmd>TestLast<cr>", "n", "<silent>"},
      {"<leader>g", "<cmd>TestVisit<cr>", "n", "<silent>"},
      {"<leader>t", "<cmd>TestNearest<cr>", "n", "<silent>"},
    }
  },
  { "numToStr/Comment.nvim" },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "tpope/vim-endwise" },
}
