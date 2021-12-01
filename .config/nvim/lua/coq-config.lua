local cmd = vim.cmd

-- cmd(':command! Lsp COQnow --shut-up')

local map = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}

map('n', '<leader>cc', ':COQnow --shut-up<cr>', options)
