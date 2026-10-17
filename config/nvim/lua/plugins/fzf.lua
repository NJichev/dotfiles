vim.pack.add({
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/nvim-tree/nvim-web-devicons",
}, { confirm = false })

local map = function(mode, lhs, rhs, desc) vim.keymap.set(mode, lhs, rhs, { desc = desc }) end
map("n", "<space>a", "<cmd>FzfLua live_grep_glob exec_empty_query=true<cr>", "fzf: live grep")
map("n", "<space>A", "<cmd>FzfLua grep_cword<cr>", "fzf: grep cursor")
map("v", "<space>A", "<cmd>FzfLua grep_visual<cr>", "fzf: grep selection")
map("n", "<space>b", "<cmd>FzfLua buffers<cr>", "fzf: buffers")
map("n", "<space>o", "<cmd>FzfLua oldfiles<cr>", "fzf: oldfiles/history/mru")
map("n", "<space>f", "<cmd>FzfLua files<cr>", "fzf: files")

do
  local fzf_lua = require("fzf-lua")

  -- local img_prev_bin = vim.fn.executable("ueberzug") == 1 and { "ueberzug" }
  local img_prev_bin = vim.fn.executable("term-image") == 1 and { "term-image" }
    or vim.fn.executable("chafa") == 1 and { "chafa" }
    or vim.fn.executable("viu") == 1 and { "viu", "-b" }
    or { "catimg" }
    or { "kitty", "+kitten", "icat" }

  -- return first matching highlight or nil
  local function hl_match(t)
    for _, h in ipairs(t) do
      local hl = vim.api.nvim_get_hl(0, { name = h, link = false })
      -- must have at least bg or fg, otherwise this returns
      -- successfully for cleared highlights (on colorscheme switch)
      if hl.fg or hl.bg then return h end
    end
  end

  local fzf_colors = function(opts)
    local colors = {
      ["fg"] = { "fg", "TelescopeNormal" },
      ["bg"] = { "bg", "TelescopeNormal" },
      ["hl"] = { "fg", hl_match({ "Directory" }) },
      ["fg+"] = { "fg", "TelescopeNormal" },
      ["bg+"] = { "bg", hl_match({ "CursorLine" }) },
      ["hl+"] = { "fg", "CmpItemKindVariable" },
      ["info"] = { "fg", hl_match({ "WarningMsg" }) },
      ["prompt"] = { "fg", "Orange" },
      ["pointer"] = { "fg", "DiagnosticError" },
      ["marker"] = { "fg", "DiagnosticError" },
      ["spinner"] = { "fg", "Label" },
      ["header"] = { "fg", "TelescopePrompt" },
      ["border"] = { "fg", "TelescopeBorder" },
      ["gutter"] = { "bg", "TelescopeSelectionCaret" },
    }

    return colors
  end

  -- custom devicons setup file to be loaded when `multiprocess = true`
  -- fzf_lua.config._devicons_setup = "~/.config/nvim/lua/plugins/devicons.lua"

  fzf_lua.setup({
    -- fzf_bin = { opts = { ["--no-separator"] = "" } },
    fzf_opts = {
      ["--border"] = "none",
    },
    fzf_colors = fzf_colors,
    winopts = {
      height = 0.45,
      width = 1.00,
      row = 0.94,
      col = 1,
      border = { " ", " ", " ", " ", " ", " ", " ", " " },
      preview = {
        split = "vertical",
        flip_columns = 130,
        scrollbar = "float",
        scrolloff = "-1",
        scrollchars = { "█", "░" },
      },
      -- on_create        = function()
      --   print("on_create")
      -- end,
    },
    color_icons = false,
    -- winopts_fn = function()
    --   local hl = {
    --     border = hl_match({ "FloatBorder" }),
    --     cursorline = hl_match({ "CursorLine" }),
    --     cursorlinenr = hl_match({ "CursorLineNr" }),
    --   }
    --   return { hl = hl }
    -- end,
    previewers = {
      bat = { theme = "Forest%20Night%20Italic" },
      builtin = {
        ueberzug_scaler = "cover",
        extensions = {
          ["gif"] = img_prev_bin,
          ["png"] = img_prev_bin,
          ["jpg"] = img_prev_bin,
          ["jpeg"] = img_prev_bin,
          ["svg"] = { "chafa" },
        },
        treesitter = { enabled = true },
        -- syntax = true, -- preview syntax highlight?
        -- syntax_limit_l = 0, -- syntax limit (lines), 0=nolimit
        -- syntax_limit_b = 1024 * 1024 * 10, -- syntax limit (bytes), 0=nolimit
        -- limit_b = 1024 * 1024 * 50, -- preview limit (bytes), 0=nolimit
      },
    },
    actions = {
      files = {
        ["default"] = fzf_lua.actions.file_edit_or_qf,
        ["ctrl-o"] = fzf_lua.actions.file_edit_or_qf,
        ["ctrl-x"] = fzf_lua.actions.arg_add,
        ["ctrl-g"] = fzf_lua.actions.arg_add,
        ["ctrl-s"] = fzf_lua.actions.file_split,
        ["ctrl-v"] = fzf_lua.actions.file_vsplit,
        ["ctrl-t"] = fzf_lua.actions.file_tabedit,
        ["ctrl-q"] = fzf_lua.actions.file_sel_to_qf,
        ["alt-q"] = fzf_lua.actions.file_sel_to_ll,
      },
      grep = {
        ["default"] = fzf_lua.actions.file_edit_or_qf,
        ["ctrl-o"] = fzf_lua.actions.file_edit_or_qf,
        ["ctrl-l"] = fzf_lua.actions.arg_add,
        ["ctrl-s"] = fzf_lua.actions.file_split,
        ["ctrl-v"] = fzf_lua.actions.file_vsplit,
        ["ctrl-t"] = fzf_lua.actions.file_tabedit,
        ["ctrl-q"] = fzf_lua.actions.file_sel_to_qf,
        ["alt-q"] = fzf_lua.actions.file_sel_to_ll,
        ["ctrl-g"] = fzf_lua.actions.grep_lgrep,
      },
    },
    files = {
      fd_opts = "--color=never --type f --hidden --follow --strip-cwd-prefix --exclude .git",
      action = { ["ctrl-g"] = fzf_lua.actions.arg_add },
      previewer = "builtin",
    },
    grep = {
      rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case -g '!.git'",
      rg_glob = true, -- enable glob parsing by default to all
      glob_flag = "--iglob", -- for case sensitive globs use '--glob'
      glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
      previewer = "builtin",
    },
    git = {
      status = {
        cmd = "git status -su",
        winopts = {
          preview = { vertical = "down:70%", horizontal = "right:70%" },
        },
        actions = {
          ["ctrl-x"] = { fzf_lua.actions.git_reset, fzf_lua.actions.resume },
        },
        preview_pager = vim.fn.executable("delta") == 1 and "delta --width=$COLUMNS",
      },
      commits = {
        winopts = { preview = { vertical = "down:60%" } },
        preview_pager = vim.fn.executable("delta") == 1 and "delta --width=$COLUMNS",
      },
      bcommits = {
        winopts = { preview = { vertical = "down:60%" } },
        preview_pager = vim.fn.executable("delta") == 1 and "delta --width=$COLUMNS",
      },
      branches = { winopts = {
        preview = { vertical = "down:75%", horizontal = "right:75%" },
      } },
    },
    lsp = { symbols = { path_shorten = 1 } },
    diagnostics = { file_icons = false, icon_padding = " ", path_shorten = 1 },
  })

  -- register fzf-lua as vim.ui.select interface
  if vim.ui then
    fzf_lua.register_ui_select({
      winopts = {
        height = 0.40,
        width = 0.70,
        row = 0.40,
      },
    })
  end
end
