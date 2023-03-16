return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {
    cmdline = {
      enabled = true,                                  -- disable if you use native command line UI
      view = "cmdline_popup",                          -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
      opts = { buf_options = { filetype = "vim" } },   -- enable syntax highlighting in the cmdline
      icons = {
        ["/"] = { icon = " " },
        ["?"] = { icon = " " },
        [":"] = { icon = ":", firstc = false },
      },
    },
    messages = {
      backend = "notify",
    },
    notify = {
      backend = "notify",
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      message = {
        view = "notify",
      },
    },
    views = {
      cmdline_popup = {
        position = {
          row = "80%",
          col = "50%",
        },
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "search_count",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
      {
        filter = { find = "Scanning" },
        opts = { skip = true },
      },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
