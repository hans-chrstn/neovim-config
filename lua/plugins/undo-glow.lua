return {
  "y3owk1n/undo-glow.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    floating_window = true,
    window = {
      width = 80,
      height = 20,
      border = "rounded",
    },
    keymaps = {
      close = "q",
      accept = "<CR>",
      next = "j",
      prev = "k",
      next_save = "J",
      prev_save = "K",
    },
  },
  keys = {
    { "<leader>u", "<cmd>UndoGlow<cr>", desc = "Open Undo Tree" },
  },
}
