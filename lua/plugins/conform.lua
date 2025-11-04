return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_fallback = true }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'black' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
      json = { 'prettier' },
      markdown = { 'prettier' },
      rust = { 'rustfmt' },
      nix = { 'alejandra' },
      java = { 'google-java-format' },
    },
  },
  keys = {
    {
      '<leader>uf',
      ':FormatToggle<CR>',
      mode = 'n',
      desc = 'Toggle Format Globally',
      silent = true,
    },
    {
      '<leader>uF',
      ':FormatToggle!<CR>',
      mode = 'n',
      desc = 'Toggle Format Locally',
      silent = true,
    },
    {
      '<leader>cf',
      '<cmd>lua require("conform").format()<cr>',
      mode = 'n',
      desc = 'Format Buffer',
      silent = true,
    },
    {
      '<leader>cF',
      '<cmd>lua require("conform").format()<cr>',
      mode = 'v',
      desc = 'Format Lines',
      silent = true,
    },
  },
}
