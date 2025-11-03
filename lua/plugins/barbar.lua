return {
	'romgrk/barbar.nvim',
	dependencies = {
		'lewis6991/gitsigns.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	event = 'BufReadPost',
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		insert_at_end = true,
	},
}
