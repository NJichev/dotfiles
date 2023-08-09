return {
  {
    -- Start the theme first so that any 
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      require("gruvbox").setup({
        palette_overrides = {
          dark0 = "#000000",
        }
      })
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    -- keys = {
    --   {"C-h", "<cmd>NvimTmuxNavigateLeft<CR>", "n", "<silent>"},
    --   {"C-j", "<cmd>NvimTmuxNavigateDown<CR>", "n", "<silent>"},
    --   {"C-k", "<cmd>NvimTmuxNavigateRight<CR>", "n", "<silent>"},
    --   {"C-l", "<cmd>NvimTmuxNavigateUp<CR>", "n", "<silent>"},
    --   {"C-\\", "<cmd>NvimTmuxNavigateLastActive<CR>", "n", "<silent>"},
    --   {"C-Space", "<cmd>NvimTmuxNavigateNext<CR>", "n", "<silent>"},
    -- },
  },
  { "bkad/CamelCaseMotion", event = { "BufReadPost", "BufNewFile" } },
  "elixir-editors/vim-elixir",
  {
    "kassio/neoterm",
    cmd = { "T", "Topen", "Tclose" },
    config = function()
      vim.g.neoterm_autoscroll = 1
      vim.g.neoterm_shell = "fish"
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
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("Comment").setup({})
    end
  },
  { "tpope/vim-surround", event = { "BufReadPost", "BufNewFile" } },
  { "tpope/vim-repeat", event = { "BufReadPost", "BufNewFile" } },
  { "tpope/vim-fugitive", event = "VeryLazy" },
  { "tpope/vim-endwise", event = { "BufReadPost", "BufNewFile" } },
  { "jiangmiao/auto-pairs", event = { "BufReadPost", "BufNewFile" } },
  { "dyng/ctrlsf.vim", cmd = { "CtrlSF" } },
  { "preservim/nerdtree", cmd = { "NERDTreeToggle" } },
}
