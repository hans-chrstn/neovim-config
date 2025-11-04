return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = {
        enabled = true,
        notify = true,
        size = 1024 * 1024,
        setup = function(ctx)
          vim.b.minianimate_disable = true
          vim.schedule(function()
            vim.bo[ctx.buf].syntax = ctx.ft
          end)
        end,
      },
      quickfile = { enabled = true },
      words = {
        enabled = true,
        debounce = 100,
      },
      gitbrowse = {
        enabled = true,
        notify = true,
      },
      lazygit = { enabled = true },
      terminal = { enabled = true },
      rename = { enabled = true },
      bufdelete = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      explorer = { enabled = false, trash = false },
      zen = {
        enabled = true,
        toggles = {
          dim = true,
          git_signs = false,
          mini_diff_signs = false,
          diagnostics = false,
          inlay_hints = false,
        },
        zoom = {
          width = 120,
        },
      },
      statuscolumn = {
        enabled = true,
        left = { "mark", "sign" },
        right = { "fold", "git" },
        folds = {
          open = false,
          git_hl = false,
        },
        git = {
          patterns = { "GitSign", "MiniDiffSign" },
        },
      },
      dashboard = {
        enabled = true,
        pane_gap = 2,
        preset = {
          header = [[
╔────────────────────────────────────────────────────────────────────╗
│                                                                    │
│  ███▄ ▄███▓ ▄▄▄      ▓█████▄ ▓█████  ██▓     ██▓ ███▄    █ ▓█████  │
│ ▓██▒▀█▀ ██▒▒████▄    ▒██▀ ██▌▓█   ▀ ▓██▒    ▓██▒ ██ ▀█   █ ▓█   ▀  │
│ ▓██    ▓██░▒██  ▀█▄  ░██   █▌▒███   ▒██░    ▒██▒▓██  ▀█ ██▒▒███    │
│ ▒██    ▒██ ░██▄▄▄▄██ ░▓█▄   ▌▒▓█  ▄ ▒██░    ░██░▓██▒  ▐▌██▒▒▓█  ▄  │
│ ▒██▒   ░██▒ ▓█   ▓██▒░▒████▓ ░▒████▒░██████▒░██░▒██░   ▓██░░▒████▒ │
│ ░ ▒░   ░  ░ ▒▒   ▓▒█░ ▒▒▓  ▒ ░░ ▒░ ░░ ▒░▓  ░░▓  ░ ▒░   ▒ ▒ ░░ ▒░ ░ │
│ ░  ░      ░  ▒   ▒▒ ░ ░ ▒  ▒  ░ ░  ░░ ░ ▒  ░ ▒ ░░ ░░   ░ ▒░ ░ ░  ░ │
│ ░      ░     ░   ▒    ░ ░  ░    ░     ░ ░    ▒ ░   ░   ░ ░    ░    │
│        ░         ░  ░   ░       ░  ░    ░  ░ ░           ░    ░  ░ │
│                       ░                                            │
│                                                                    │
╚────────────────────────────────────────────────────────────────────╝]],
        },
        formats = {
          key = function(item)
            return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
          end,
        },
        sections = {
          { section = "header" },
          {
            padding = 1,
            text = {
              { "󰭎 ", hl = "SnacksDashboardIcon" },
              { "[f] ", hl = "SnacksDashboardKey" },
              { "Search  ", hl = "SnacksDashboardDesc" },
              { "󰍉 ", hl = "SnacksDashboardIcon" },
              { "[l] ", hl = "SnacksDashboardKey" },
              { "Word Search  ", hl = "SnacksDashboardDesc" },
              { " ", hl = "SnacksDashboardIcon" },
              { "[o] ", hl = "SnacksDashboardKey" },
              { "Recent Files  ", hl = "SnacksDashboardDesc" },
              { " ", hl = "SnacksDashboardIcon" },
              { "[n] ", hl = "SnacksDashboardKey" },
              { "New File  ", hl = "SnacksDashboardDesc" },
              { "󰩈 ", hl = "SnacksDashboardIcon" },
              { "[q] ", hl = "SnacksDashboardKey" },
              { " Exit", hl = "SnacksDashboardDesc" },
            },
            align = "center",
          },
          { hidden = true, key = "f", action = ":Telescope find_files" },
          { hidden = true, key = "l", action = ":Telescope live_grep" },
          { hidden = true, key = "o", action = ":Telescope oldfiles" },
          {
            hidden = true,
            key = "n",
            action = function()
              local filename = vim.fn.input("Enter filename: ")
              if filename ~= "" then
                vim.cmd("edit " .. filename)
              else
                print("Filename cannot be empty")
              end
            end,
          },
          { hidden = true, key = "q", action = ":qa" },
          {
            icon = "",
            title = "Recently Used:",
            section = "recent_files",
            limit = 10,
            cwd = false,
            indent = 2,
            padding = 1,
          },
          {
            icon = "",
            title = "Projects:",
            section = "projects",
            limit = 8,
            indent = 2,
            padding = 1,
          },
        },
      },
      notifier = { enabled = false },
      scroll = { enabled = false },
      picker = { enabled = false },
      scope = { enabled = false },
      scratch = { enabled = false },
      animate = { enabled = false },
    },
    keys = {
      { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      { "<leader>gb", function() Snacks.gitbrowse() end, desc = "Open in GitHub/GitLab" },
      { "<leader>gB", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
      { "<leader>rn", function() Snacks.rename.rename_file() end, desc = "Rename File (LSP-aware)" },
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
      { "<leader>bD", function() Snacks.bufdelete.all() end, desc = "Delete All Buffers" },
      { "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Delete Other Buffers" },
      { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Word Reference" },
      { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Previous Word Reference" },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "LazyGit" },
      { "<leader>tt", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal (Split)" }
    },
  },
}
