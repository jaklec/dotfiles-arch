local map = vim.api.nvim_set_keymap
local options = { noremap=true, silent=true }

map('n', '<leader>ww', ':edit ~/Documents/notes/docs/index.md<CR>', options)
