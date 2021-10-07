local nvim_lsp = require("lspconfig")

-- Autostart COQ on startup. This must happen before `require("coq")`.
-- The auto_start parameter can have values [false|true|'shut-up']
vim.g.coq_settings = {auto_start = 'shut-up'}

local coq = require("coq")

local on_attach = function(client, bufnr)
  local function buf_map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = {noremap = true, silent = true}

  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")

  buf_map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
          opts)
  buf_map("n", "<leader>wr",
          "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_map("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_map("n", "<leader>el",
          "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_map("n", "<leader>ep", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_map("n", "<leader>en", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_map("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",
          opts)
  buf_map("n", "<leader>fs", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_map("v", "<leader>fs", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_map("n", "<leader>o", "<cmd>lua lsp_organize_imports()<CR>", opts)

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec([[
         augroup LspAutocommands
             autocmd! * <buffer>
             autocmd BufWritePost <buffer> LspFormatting
         augroup END
         ]], true)
  end
end

local servers = {
  'pyright', -- yay -S pyright
  'rust_analyzer', -- yay -S rust-analyzer
  'tsserver', -- yay -S typescript-language-server-bin
  'gopls', -- yay -S gopls
  'vuels', -- yay -S nodejs-vls
  'svelte', -- yay -S nodejs-svelte-language-server
  'dockerls', -- yay -S dockerfile-language-server
  'yamlls', -- yay -S yaml-language-server
  "jdtls", -- yay -S jdtls
  "clangd", -- yay -S clang
  "tailwindcss", -- yay -S tailwindcss-language-server
  "graphql", -- yay -S graphql-lsp
  "sqls", -- yay -S sqls
  "bashls", -- yay -S bash-language-server
  "jsonls" -- yay -S vscode-json-languageserver (create a sym link vscode-json-language-server)
}
for _, lsp in ipairs(servers) do
  local lsp_config = {
    on_attach = on_attach,
    flags = {debounce_text_changes = 150}
  }

  if lsp == 'jdtls' then lsp_config.cmd = {lsp} end

  nvim_lsp[lsp].setup(coq.lsp_ensure_capabilities(lsp_config))
end
