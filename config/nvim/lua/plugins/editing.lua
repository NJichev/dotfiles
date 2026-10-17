local gh = function(repo) return "https://github.com/" .. repo end

vim.pack.add({
  gh("christoomey/vim-tmux-navigator"),
  gh("bkad/CamelCaseMotion"),
  gh("kassio/neoterm"),
  gh("vim-test/vim-test"),
  gh("tpope/vim-surround"),
  gh("tpope/vim-repeat"),
  gh("tpope/vim-fugitive"),
  gh("tpope/vim-endwise"),
  gh("jiangmiao/auto-pairs"),
  gh("dyng/ctrlsf.vim"),
  gh("preservim/nerdtree"),
}, { confirm = false })

-- Neoterm
vim.g.neoterm_autoscroll = 1
vim.g.neoterm_shell = "fish"
vim.g.neoterm_default_mod = "botright"

-- vim-test
vim.g["test#strategy"] = "neoterm"
vim.g["test#python#runner"] = "pytest"

-- Run umbrella app tests from the root of the umbrella
vim.g["test#custom_transformations"] = {
  elixir_umbrella = function(cmd)
    if string.match(cmd, "apps/") then
      return cmd:gsub("mix test apps/([^/]*)/", "mix cmd --app %1 mix test --color ")
    else
      return cmd
    end
  end,
}
vim.g["test#transformation"] = "elixir_umbrella"

vim.keymap.set("n", "<leader>T", "<cmd>TestFile<cr>", { silent = true })
vim.keymap.set("n", "<leader>a", "<cmd>TestSuite<cr>", { silent = true })
vim.keymap.set("n", "<leader>l", "<cmd>TestLast<cr>", { silent = true })
vim.keymap.set("n", "<leader>g", "<cmd>TestVisit<cr>", { silent = true })
vim.keymap.set("n", "<leader>t", "<cmd>TestNearest<cr>", { silent = true })

-- Auto Pairs
vim.g.AutoPairs = { ["("] = ")", ["["] = "]", ["{"] = "}", ["'"] = "'", ['"'] = '"', ["`"] = "`" }
