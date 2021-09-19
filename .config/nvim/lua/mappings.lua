local map = vim.api.nvim_set_keymap

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

-- Quickly create a new file next to the file in current open buffer.
map('n', '<leader>fn', ':edit <C-R>=expand("%:p:h") . "/" <CR>', { noremap=true, silent=false })

-- Open a terminal shell below current window
map('n', '<leader>tr', ':below 10sp term://$SHELL<cr>', { noremap=true, silent=true })
