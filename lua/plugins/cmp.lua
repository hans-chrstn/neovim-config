return {
  'saghen/blink.cmp',
  version = '*',
  event = "InsertEnter",
  dependencies = { 'L3MON4D3/LuaSnip' },
  opts = {
    snippets = { preset = 'luasnip' },
    keymap = {
      preset = "default",
      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        auto_show = true,
        draw = {
          columns = {
            { "label",     "label_description", gap = 1 },
            { "kind_icon", "kind",              gap = 1 },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      },
      ghost_text = {
        enabled = true,
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    cmdline = {
      sources = {
        default = { "buffer", "cmdline" },
      },
    },

    signature = {
      enabled = true,
      window = {
        border = 'rounded',
      },
    },
  },
  opts_extend = { "sources.default" },
}
