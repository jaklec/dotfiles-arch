local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

map('n', '<leader>fe', ':RnvimrToggle<CR>', opts)

vim.g.rnvimr_enable_picker = 1
