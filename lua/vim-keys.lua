local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ' '

local keys = {
  {
    mode = "n",
    key = "<leader>d",
    cmd = "<cmd>lua vim.diagnostic.open_float(nil, { focus = false })<cr>",
    opts = { noremap = true, silent = true, desc = "Open diagnostics float" }
  },
}

for _, map in ipairs(keys) do
  keymap(map.mode, map.key, map.cmd, map.opts)
end
