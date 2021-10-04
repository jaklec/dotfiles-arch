" Don't use python form virualenv as it requires neovim stuff to be installed
let g:python_host_prog="/usr/bin/python2"
let g:python3_host_prog="/usr/bin/python"

" Read ~/.vimrc
if filereadable(expand($HOME.'/.vimrc'))
  source $HOME/.vimrc
endif


" Non-Plug stuff after this line
" ================================
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
end

set termguicolors

set signcolumn=yes

set cursorline
set cursorcolumn

set hidden " https://medium.com/usevim/vim-101-set-hidden-f78800142855

" Use neovim live substitution
set inccommand=split

set completeopt=menuone,noselect

" --------------------
" Folds
"
" zf: create new fold
" zc: close fold
" zo: open fold
" zd: delete fold
"
" example:
" f{v%zf: jump to '{' mark all until matching '}' and create fold
" --------------------
set foldcolumn=1

:lua <<EOF
  require('plugins')
  require('vscode-theme-config')
  require('mappings')
  require('gitgutter-config')
  require('telescope-config')
  require('treesitter-config')
  require('lsp-config')
  require('formatter-config')
  require('coq-config')
  require('nvim-autopairs').setup()
  require('rnvimr-config')
  require('lualine-config')
  require('vimspector-config')
  require('tagbar')
  require('vim-test-config')
  require('wiki')
EOF


"""" Abbreviations
iab servcie service
iab serivce service
iab improt import
iab publci public
iab isntall install

cnoreabbrev buffers Buffers
