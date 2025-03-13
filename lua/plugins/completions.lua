return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets'
    }
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require 'cmp'
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        enable = function()
          local context = require 'cmp.config.context'
          if vim.api.nvim_get_mode().mode == 'c' then
            return true
          else
            return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
          end
        end,
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp', max_item_count = 6 },
          { name = 'luasnip' },
          { name = 'buffer',   max_item_count = 6 },
          { name = 'path' },
        }, {
          { name = 'buffer' },
        }),
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false
        },
        experimantal = {
          ghost_text = false,
          native_menu = false
        }
      })
    end
  }
}
