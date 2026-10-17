vim.pack.add({
  -- A release tag lets blink download its prebuilt fuzzy matcher
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
  "https://github.com/rafamadriz/friendly-snippets",
}, { confirm = false })

require("blink.cmp").setup({
  keymap = {
    preset = 'default',
    ['<C-e>'] = { 'accept', 'fallback' },
  },

  appearance = {
    nerd_font_variant = 'mono'
  },

  completion = {
    documentation = { auto_show = false },
    menu = {
      draw = {
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind", gap = 1 },
          { "source_name" },  -- This shows which LSP/source provided the completion
        },
      },
    },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
    -- Optionally customize how source names are displayed
    providers = {
      lsp = {
        name = 'LSP',
        -- Show the actual LSP client name
        transform_items = function(_, items)
          for _, item in ipairs(items) do
            -- Add the LSP client name to the source display
            if item.client_id then
              local client = vim.lsp.get_client_by_id(item.client_id)
              if client then
                item.source_name = client.name
              end
            end
          end
          return items
        end,
      },
      path = { name = 'Path' },
      snippets = { name = 'Snip' },
      buffer = { name = 'Buf' },
    },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" }
})
