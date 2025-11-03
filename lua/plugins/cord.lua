return {
  {
    'vyfor/cord.nvim',
    build = './build',
    event = "VeryLazy",
    keys = {
      { "<leader>Ct", function() require('cord.api.command').toggle_presence() end, desc = "Toggle Discord Presence" },
      { "<leader>Ci", function() require('cord.api.command').toggle_idle_force() end, desc = "Toggle Idle Status" },
    },
    config = function()
      local function get_git_branch()
        local handle = io.popen('git branch --show-current 2>/dev/null')
        if not handle then return '' end
        local branch = handle:read("*a"):gsub('\n', '')
        handle:close()
        return branch
      end
      
      local git_branch = get_git_branch()
      
      local quotes = {
        'fuck windows',
        'putangina',
        'why tf are ram prices so high',
      }
      
      require('cord').setup({
        log_level = 'error',
        editor = {
          image = nil,
          client = 'neovim',
          tooltip = 'The Superior Text Editor',
        },
        idle = {
          show_status = true,
          timeout = 300000,
          tooltip = '💤',
          details = function(opts)
            return string.format('Definitely not taking a break')
          end,
        },
        text = {
          editing = function(opts)
            local filename = opts.filename or 'a file'
            local workspace = opts.workspace or 'unknown workspace'
            return string.format('Editing %s, in %s', filename, workspace)
          end,
        },
        buttons = {
          {
            label = function(opts)
              return opts.repo_url and 'View Repository' or 'My Profile'
            end,
            url = function(opts)
              if opts.is_idle then return nil end
              return opts.repo_url or 'https://github.com/hans-chrstn'
            end,
          },
        },
        hooks = {
          workspace_change = function(opts)
            git_branch = get_git_branch()
          end,
          post_activity = function(opts, activity)
            activity.state = quotes[math.random(#quotes)]
          end,
        },
      })
    end,
  },
}
