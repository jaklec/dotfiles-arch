local map = vim.api.nvim_set_keymap

options = { noremap = true, silent = true }

map('n', '<C-p>', ':lua require("telescope.builtin").find_files()<cr>', options)
map('n', '<leader>s', ':lua require("telescope.builtin").live_grep()<cr>', options)
map('n', '<leader>b', ':lua require("telescope.builtin").buffers()<cr>', options)
