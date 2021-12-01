require("formatter").setup({
  filetype = {
    typescript = {
      function()
        return {
          exe = "prettierd", -- yay -S prettierd
          args = {vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    javascript = {
      function()
        return {
          exe = "prettierd",
          args = {vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    json = {
      function()
        return {
          exe = "prettierd",
          args = {vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    lua = {
      function()
        return {
          exe = "lua-format", -- yay -S lua-format
          args = {vim.api.nvim_buf_get_name(0), '--indent-width=2'},
          stdin = true
        }
      end
    },
    rust = {
      function()
        return {
          exe = "rustfmt", -- yay -S lua-format
          args = {'--emit=stdout'},
          stdin = true
        }
      end
    }
  }
})

-- Format on save
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.ts,*.js,*.lua,*.rs FormatWrite
augroup END
]], true)
