return {
  {
    'nvimdev/lspsaga.nvim',
    event = "LspAttach",
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      ui = {
        border = "rounded",
        code_action = "💡",
      },
      symbol_in_winbar = {
        enable = true,
        separator = " › ",
      },
      lightbulb = {
        enable = true,
        sign = true,
        virtual_text = false,
      },
    },
    keys = {
      { "gh", "<cmd>Lspsaga finder<CR>", desc = "LSP Finder" },
      { "<leader>ca", "<cmd>Lspsaga code_action<CR>", mode = { "n", "v" }, desc = "Code Action" },
      { "<leader>rn", "<cmd>Lspsaga rename<CR>", desc = "Rename" },
      { "gp", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
      { "gd", "<cmd>Lspsaga goto_definition<CR>", desc = "Go to Definition" },
      { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Line Diagnostics" },
      { "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Previous Diagnostic" },
      { "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next Diagnostic" },
      { "<leader>o", "<cmd>Lspsaga outline<CR>", desc = "Toggle Outline" },
      { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover Documentation" },
    },
  },

  {
    "dundalek/lazy-lsp.nvim",
    version = "*",
    dependencies = {
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      
      return {
        use_vim_lsp_config = true,
        excluded_servers = {
          "jdtls",
          "ccls",
        },
        preferred_servers = {
          markdown = {},
          python = { "pyright" },
          rust = { "rust_analyzer" },
          javascript = { "ts_ls" },
          typescript = { "ts_ls" },
          lua = { "lua_ls" },
          nix = { "nil_ls" },
          c = { "clangd" },
          cpp = { "clangd" },
          go = { "gopls" },
        },
        default_config = {
          capabilities = capabilities,
        },
        configs = {
          lua_ls = {
            settings = {
              Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                },
                telemetry = { enable = false },
              },
            },
          },
          rust_analyzer = {
            settings = {
              ["rust-analyzer"] = {
                cargo = {
                  allFeatures = true,
                  targetDir = "/tmp/rust-analyzer",
                },
                checkOnSave = {
                  command = "clippy",
                  extraArgs = { "--target-dir", "/tmp/rust-analyzer-check" },
                },
              },
            },
          },
        },
      }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "saghen/blink.cmp",
      "dundalek/lazy-lsp.nvim",
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = {
          spacing = 4,
          prefix = "●",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = true,
          header = "",
          prefix = "",
        },
      })
      
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(event)
          local bufnr = event.buf
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          
          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
          end
          
          map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
          map("n", "gs", vim.lsp.buf.signature_help, "Signature Help")
          map("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, "Format Document")
          
          if client and client:supports_method("textDocument/documentHighlight") then
            local hl_group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = bufnr,
              group = hl_group,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = bufnr,
              group = hl_group,
              callback = vim.lsp.buf.clear_references,
            })
          end
          
          if client and client:supports_method("textDocument/inlayHint") then
            map("n", "<leader>th", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
            end, "Toggle Inlay Hints")
          end
        end,
      })
      
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "gd", "gdscript", "gdscript3" },
        callback = function()
          local root = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, {
            path = vim.api.nvim_buf_get_name(0),
            upward = true,
          })[1])
          
          if root then
            vim.lsp.start({
              name = "Godot",
              cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
              root_dir = root,
              capabilities = capabilities,
              on_attach = function()
                vim.notify('Godot LSP connected!', vim.log.levels.INFO)
              end,
            })
          end
        end,
      })
    end,
  },
}
