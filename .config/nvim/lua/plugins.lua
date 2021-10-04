vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  -- vim.cmd([[colorscheme gruvbox]])

  use "Mofiqul/vscode.nvim"

  use "windwp/nvim-autopairs"

  use "SirVer/ultisnips"

  use 'machakann/vim-highlightedyank'

  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'

  use 'terryma/vim-multiple-cursors'

  use 'godlygeek/tabular'

  -- matching paranthesis
  use 'luochen1990/rainbow'

  use 'majutsushi/tagbar'
  use 'ludovicchabant/vim-gutentags'
  use 'airblade/vim-rooter'

  -- :: Git ::
  -- Gutter signs and higlights based on git diff
  use 'airblade/vim-gitgutter'

  -- Run git commands within vim
  -- - :Gstatus show `git status`
  -- - <C-n>/<C-p> next/prev file
  -- - - add/reset file under cursor
  -- - ca :Gcommit --amend
  -- - cc :Gcommit
  -- - D : Gdiff
  -- - :Gcommit for committing
  -- - :Gblame run blame on current file
  use 'tpope/vim-fugitive'

  use 'KabbAmine/vCoolor.vim'
  use 'lilydjwg/colorizer'

  -- use 'francoiscabrol/ranger.vim'
  use 'kevinhwang91/rnvimr'

  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}

  use 'mechatroner/rainbow_csv'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- use {
  --   'neoclide/coc.nvim',  
  --   branch = 'release' 
  -- }
  use { 'neovim/nvim-lspconfig' }
  use { 'mhartington/formatter.nvim'}
  use { 'ms-jpq/coq_nvim', branch = 'coq'} -- main one
  use { 'ms-jpq/coq.artifacts', branch= 'artifacts'} -- 9000+ Snippets

  use { 'hoob3rt/lualine.nvim' }

  use { 'puremourning/vimspector' }
  use { 'vim-test/vim-test' }

end)
