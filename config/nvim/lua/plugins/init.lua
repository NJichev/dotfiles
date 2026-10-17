-- Build hooks have to be registered before the first vim.pack.add()
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
      vim.cmd("TSUpdate")
    end
  end,
})

-- Colorscheme first, so everything else picks up its highlights
vim.pack.add({ "https://github.com/ellisonleao/gruvbox.nvim" }, { confirm = false })

require("gruvbox").setup({
  palette_overrides = {
    dark0 = "#000000",
  },
  overrides = {
    ["@module.elixir"] = { link = "GruvboxYellow" },
  },
})
vim.cmd.colorscheme("gruvbox")

require("plugins.editing")
require("plugins.treesitter")
require("plugins.completion")
require("plugins.fzf")
require("plugins.elixir")
