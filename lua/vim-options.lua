vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0

local disabled_plugins = {
	"gzip",
	"netrwPlugin",
	"tarPlugin",
	"tohtml",
	"tutor",
	"zipPlugin",
	"rplugin",
	"editorconfig",
	"matchparen",
	"matchit",
}

for _, plugin in ipairs(disabled_plugins) do
	vim.g["loaded_" .. plugin] = 1
end

vim.g.matchparen_timeout = 20
vim.g.matchparen_insert_timeout = 20

local options = {
	wrap = false,
	termguicolors = true,
	number = true,
	relativenumber = true,
	numberwidth = 2,
	cursorline = false,
	cursorcolumn = false,
	showmode = false,
	showmatch = true,
	matchtime = 2,
	winbar = "%=%m %F",
	conceallevel = 3,
	cmdheight = 0,
	laststatus = 3,
	showtabline = 0,
	list = false,
	smoothscroll = true,

	splitright = true,
	splitbelow = true,
	equalalways = true,

	hlsearch = true,
	ignorecase = true,
	smartcase = true,
	incsearch = true,
	inccommand = "nosplit",

	autoindent = true,
	expandtab = true,
	smarttab = true,
	smartindent = true,
	shiftround = true,
	shiftwidth = 2,
	tabstop = 2,
	softtabstop = 2,

	hidden = true,
	mouse = "a",
	mousescroll = "ver:2,hor:6",
	scrolloff = 3,
	sidescrolloff = 3,
	joinspaces = false,
	ttimeoutlen = 10,
	updatetime = 250,
	confirm = false,
	wildmode = "longest:full,full",
	autochdir = true,

	undofile = true,
	shada = "!,'50,<50,s10,h,r/tmp",

	-- foldenable = false,
	-- foldlevel = 99,
	-- foldlevelstart = 99,
	-- foldcolumn = '1',
	-- foldmethod = 'expr',
	-- foldexpr = 'nvim_treesitter#foldexpr()',

	virtualedit = "block",
	modelines = 5,
	modeline = true,
	modelineexpr = false,
	path = "**",

	lazyredraw = false,
	redrawtime = 1500,
	synmaxcol = 240,
	re = 0,

	completeopt = "menu,menuone,noselect",

	swapfile = false,
	backup = false,
	writebackup = false,
}

for op, val in pairs(options) do
	vim.opt[op] = val
end

vim.opt.formatoptions = vim.opt.formatoptions - "a" - "t" + "c" - "o" + "r" + "n" + "j" - "2"

vim.opt.clipboard = "unnamedplus"
vim.opt.isfname:append("@-@")

if vim.fn.executable("rg") == 1 then
	vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
	vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

if vim.fn.executable("prettier") == 1 then
	vim.opt.formatprg = "prettier --stdin-filepath=%"
end

local border = "none"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = border,
})

vim.diagnostic.config({
	float = {
		border = border,
	},
})

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.filetype.add({
	extension = {
		gd = "gdscript",
		tres = "gdresource",
		tscn = "gdscene",
	},
})
