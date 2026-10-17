local gh = function(repo) return "https://github.com/" .. repo end

-- Keep ftplugin maps from shadowing the ]m/[m textobject moves below
vim.g.no_ruby_maps = true
vim.g.no_python_maps = true

vim.pack.add({
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
  { src = gh("nvim-treesitter/nvim-treesitter-textobjects"), version = "main" },
  gh("windwp/nvim-ts-autotag"),
}, { confirm = false })

local parsers = {
  "bash", "c", "cpp", "css", "comment", "devicetree", "dockerfile", "diff",
  "eex", "elixir", "elm", "embedded_template", "erlang", "fish",
  "git_rebase", "gitattributes", "gitcommit", "gitignore", "go", "graphql",
  "heex", "html", "javascript", "jq", "jsdoc", "json", "json5", "lua",
  "make", "markdown", "markdown_inline", "nix", "perl", "python", "query",
  "regex", "ruby", "rust", "scss", "scheme", "sql", "surface", "toml",
  "tsx", "typescript", "vim", "yaml",
}

-- Async, and a no-op for parsers that are already installed
require("nvim-treesitter").install(parsers)

-- Filetypes that still need regex syntax next to treesitter
local keep_syntax = { python = true, vim = true }

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    if not pcall(vim.treesitter.start, args.buf) then return end
    if keep_syntax[vim.bo[args.buf].filetype] then
      vim.bo[args.buf].syntax = "on"
    end
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

require("nvim-ts-autotag").setup({})

-- Textobjects
require("nvim-treesitter-textobjects").setup({
  select = { lookahead = true, include_surrounding_whitespace = false },
  move = { set_jumps = true },
})

local select = require("nvim-treesitter-textobjects.select")
local swap = require("nvim-treesitter-textobjects.swap")
local move = require("nvim-treesitter-textobjects.move")

for lhs, query in pairs({
  ix = "@comment.inner",
  ax = "@comment.outer",
  af = "@function.outer",
  ["if"] = "@function.inner",
  ac = "@class.outer",
  ic = "@class.inner",
  aC = "@conditional.outer",
  iC = "@conditional.inner",
}) do
  vim.keymap.set({ "x", "o" }, lhs, function() select.select_textobject(query, "textobjects") end,
    { desc = "ts: " .. query })
end

vim.keymap.set("n", "[w", function() swap.swap_next("@parameter.inner") end, { desc = "ts: swap next parameter" })
vim.keymap.set("n", "]w", function() swap.swap_previous("@parameter.inner") end, { desc = "ts: swap previous parameter" })

for lhs, fn in pairs({
  ["]m"] = function() move.goto_next_start("@function.outer", "textobjects") end,
  ["]C"] = function() move.goto_next_start("@class.outer", "textobjects") end,
  ["[m"] = function() move.goto_previous_start("@function.outer", "textobjects") end,
  ["[C"] = function() move.goto_previous_start("@class.outer", "textobjects") end,
}) do
  vim.keymap.set({ "n", "x", "o" }, lhs, fn)
end
