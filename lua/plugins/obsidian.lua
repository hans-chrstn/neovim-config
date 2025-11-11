return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	event = {
		"BufReadPre ~/Documents/Obsidian/*/*.md",
		"BufNewFile ~/Documents/Obsidian/*/*.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "Personal",
				path = "~/Documents/Obsidian/Personal",
			},
			{
				name = "Work",
				path = "~/Documents/Obsidian/Work",
			},
		},
	},
	cmd = {
		"ObsidianOpen",
		"ObsidianRename",
		"ObsidianQuickSwitch",
		"ObsidianNew",
		"ObsidianSearch",
		"ObsidianTemplate",
		"ObsidianToday",
		"ObsidianTomorrow",
		"ObsidianYesterday",
		"ObsidianNewFromTemplate",
		"ObsidianToggleCheckbox",
		"ObsidianPasteImg",
		"ObsidianFollowLink",
		"ObsidianBacklinks",
		"ObsidianTags",
		"ObsidianDailies",
		"ObsidianLink",
		"ObsidianLinks",
		"ObsidianLinkNew",
		"ObsidianExtractNote",
		"ObsidianWorkspace",
	},
}
