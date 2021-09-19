vim.g.vimspector_enable_mappings = 'HUMAN'

local map = vim.api.nvim_set_keymap

options = { noremap = true }

map('n', '<leader>vl', ':call vimspector#Launch()<CR>', options)
map('n', '<leader>vc', ':call vimspector#Reset()<CR>', options)

vim.g.vimspector_install_gadgets = { "debugpy", "vscode-go", "CodeLLDB", "vscode-node-debug2" }
