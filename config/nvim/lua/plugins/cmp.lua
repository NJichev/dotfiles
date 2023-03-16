return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    init = function() vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" } end,
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local select_opts = {behavior = cmp.SelectBehavior.Select}

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        sources = {
          {name = 'path'},
          {name = 'nvim_lsp', keyword_length = 1},
          {name = 'buffer', keyword_length = 3},
          {name = 'luasnip', keyword_length = 2},
          { name = "spell", keyword_length = 5 },
        },
        window = {
          documentation = cmp.config.window.bordered()
        },
        formatting = {
          format = require("lspkind").cmp_format {
            with_text = true,
            menu = {
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              -- emoji = "[Emoji]",
              spell = "[Spell]",
              path = "[Path]",
              cmdline = "[Cmd]",
            },
          },
        },
        mapping = {
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),

          ['<C-j>'] = cmp.mapping.abort(),
          ['<C-e>'] = cmp.mapping.confirm({select = true}),
          ['<CR>'] = cmp.mapping.confirm({select = false}),

          ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, {'i', 's'}),

          ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {'i', 's'}),

          ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
              cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
              fallback()
            else
              cmp.complete()
            end
          end, {'i', 's'}),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item(select_opts)
            else
              fallback()
            end
          end, {'i', 's'}),
        },
      })
    end,
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline", event = { "CmdlineEnter" } },
      { "saadparwaiz1/cmp_luasnip" },
      "onsails/lspkind-nvim",
      "f3fora/cmp-spell",
    }
  },
}
