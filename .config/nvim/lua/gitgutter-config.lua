local map = vim.api.nvim_set_keymap

local options = { noremap = true }

map('n', '<leader>hn', ':GitGutterNextHunk<cr>', options)
map('n', '<leader>hp', ':GitGutterPrevHunk<cr>', options)
map('n', '<leader>hu', ':GitGutterUndoHunk<cr>', options)
