return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  keys = {
      {
        "<leader>ghb",
        function() require("gitsigns").blame_line({ full = true }) end,
        desc = "Blame Line",
      },
      {
        "<leader>ghd",
        function() require("gitsigns").diffthis() end,
        desc = "Diff This",
      },
      {
        "<leader>ghp",
        function() require("gitsigns").preview_hunk() end,
        desc = "Preview Hunk",
      },
      {
        "<leader>ghR",
        function() require("gitsigns").reset_buffer() end,
        desc = "Reset Buffer",
      },
      {
        "<leader>ghr",
        function() require("gitsigns").reset_hunk() end,
        mode = { "n", "v" },
        desc = "Reset Hunk",
      },
      {
        "<leader>ghs",
        function() require("gitsigns").stage_hunk() end,
        mode = { "n", "v" },
        desc = "Stage Hunk",
      },
      {
        "<leader>ghS",
        function() require("gitsigns").stage_buffer() end,
        desc = "Stage Buffer",
      },
      {
        "<leader>ghu",
        function() require("gitsigns").undo_stage_hunk() end,
        desc = "Undo Stage Hunk",
      },
      {
        "]h",
        function() require("gitsigns").next_hunk() end,
        desc = "Next Hunk",
      },
      {
        "[h",
        function() require("gitsigns").prev_hunk() end,
        desc = "Previous Hunk",
      },
      {
        "<leader>gtb",
        function() require("gitsigns").toggle_current_line_blame() end,
        desc = "Toggle Line Blame",
      },
      {
        "<leader>gtd",
        function() require("gitsigns").toggle_deleted() end,
        desc = "Toggle Deleted",
      },
  },
  cmd = 'Gitsigns',
  opts = {},
}
