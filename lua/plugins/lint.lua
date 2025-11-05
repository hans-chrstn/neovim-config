return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      nix = { "statix" },
      sh = { "shellcheck" },
      bash = { "shellcheck" },
      lua = { "luacheck" },
      python = { "ruff" },
      java = { "checkstyle" },
      kotlin = { "ktlint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        vim.defer_fn(function()
          lint.try_lint()
        end, 100)
      end,
    })
  end,
}
