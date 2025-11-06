return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "classic",
			icons = {
				breadcrumb = "»",
				separator = "",
				group = "+",
			},
			win = {
				border = "none",
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.add({
				{ "<leader>/", group = "search" },
				{ "<leader>:", group = "search" },
				{ "<leader>a", group = "actions" },
				{ "<leader>b", group = "buffer" },
				{ "<leader>c", group = "code" },
				{ "<leader>d", group = "debug" },
				{ "<leader>e", group = "explorer" },
				{ "<leader>f", group = "find/file" },
				{ "<leader>g", group = "git" },
				{ "<leader>o", group = "outline" },
				{ "<leader>q", group = "quit/session" },
				{ "<leader>t", group = "toggle/terminal" },
				{ "<leader>u", group = "ui" },
				{ "<leader>x", group = "diagnostics/quickfix" },
				{ "<leader>z", group = "zen mode" },
				{ "<leader><Tab>", group = "tab" },
			})
		end,

		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
