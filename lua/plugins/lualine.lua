return {
  "nvim-lualine/lualine.nvim",
  event = 'VimEnter',
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/trouble.nvim" }, -- Ensure trouble is loaded
  opts = {
    sections = {
      lualine_c = {''},
    },
  },
}

