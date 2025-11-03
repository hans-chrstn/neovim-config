return {
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>e', '<cmd>Yazi<cr>', desc = 'Open yazi at the current file',
    },
    {
      '<leader>cw', '<cmd>Yazi cwd<cr>', desc = 'Open yazi at the current working directory',
    },
    {
      '<c-up>', '<cmd>Yazi toggle<cr>', desc = 'Resume the last yazi session',
    },
  },
  opts = {
    open_for_directories = true,
    enable_mouse_support = true,
    floating_window_scaling_factor = 0.8,
    yazi_floating_window_border = 'single',
    yazi_floating_window_winblend = 10,
  },
}
