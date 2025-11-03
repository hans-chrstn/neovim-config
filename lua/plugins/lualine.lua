return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/trouble.nvim" }, -- Ensure trouble is loaded
  event = { "VimEnter", "VeryLazy" },
  opts = {
    sections = {
      lualine_c = {''},
    },
  },
}

