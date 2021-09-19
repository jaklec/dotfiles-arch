local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

map('n', '<leader>tn', ':TestNearest<cr>', options)
map('n', '<leader>tf', ':TestFile<cr>', options)
map('n', '<leader>ts', ':TestSuite<cr>', options)
map('n', '<leader>tl', ':TestLast<cr>', options)
map('n', '<leader>tv', ':TestVisit<cr>', options)
