return {
  {
    -- Start the theme first so that any 
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000
  },
  "christoomey/vim-tmux-navigator",
  "bkad/CamelCaseMotion",
  {
    "kassio/neoterm",
    cmd = { "T", "Topen", "Tclose" },
    config = function()
      vim.g.neoterm_autoscroll = 1
    end
  },
  {
    "vim-test/vim-test",
    dependencies = {
      "kassio/neoterm"
    },
    keys = {
      {"<leader>T", "<cmd>TestFile<cr>", "n", "<silent>"},
      {"<leader>a", "<cmd>TestSuite<cr>", "n", "<silent>"},
      {"<leader>l", "<cmd>TestLast<cr>", "n", "<silent>"},
      {"<leader>g", "<cmd>TestVisit<cr>", "n", "<silent>"},
      {"<leader>t", "<cmd>TestNearest<cr>", "n", "<silent>"},
    }
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup({})
    end
  },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "tpope/vim-endwise" },
}
