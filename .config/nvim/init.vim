" Don't use python form virualenv as it requires neovim stuff to be installed
let g:python_host_prog="/usr/bin/python2"
let g:python3_host_prog="/usr/bin/python"

" Read ~/.vimrc
if filereadable(expand($HOME.'/.vimrc'))
  source $HOME/.vimrc
endif

call plug#begin('~/.vim/plugged')

" :: Appearance ::
" Classic gruvbox theme
Plug 'morhetz/gruvbox'
Plug 'cormacrelf/vim-colors-github'

Plug 'ap/vim-buftabline'

" :: Editing ::
" Auto close parens/quotes
Plug 'cohama/lexima.vim'

" Code snippets
Plug 'SirVer/ultisnips'

" Highlight while yanking
" Example: Presssing `3Y` will highlight the next three lines (which are
" also beeing yanked).
Plug 'machakann/vim-highlightedyank'

" Vim commenter
" - Use gcc to comment out a line (takes a count)
" - gc to comment out the target of a motion (for example, gcap to comment out a paragraph)
" - gc in visual mode to comment out the selection
" - gc in operator pending mode to target a comment
" - You can also use it as a command, either with a range like :7,17Commentary, or as part of a :global invocation like with :g/TODO/Commentary. That's it.
Plug 'tpope/vim-commentary'

" Edit surrounding qoutes/parrents
" - {Visual}S<arg> surrounds selection
" - cs/ds<arg1><arg2> change/delete
" - cst<arg> change tag elemnt in markup
" - ys<obj><arg> surrounds text object
" - yss<arg> for entire line
Plug 'tpope/vim-surround'

" Edit with multiple cursors
" - Ctrl-n next cursor
" - Ctrl-p previous cursor
" - Ctrl-x skip cursor and move to next
Plug 'terryma/vim-multiple-cursors'

" Align text
" :Tab /=> aligns all '=>' in selection
Plug 'godlygeek/tabular'

" Matching parantheses
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'airblade/vim-rooter'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

" :: Git ::
" Gutter signs and higlights based on git diff
Plug 'airblade/vim-gitgutter'

" Run git commands within vim
" - :Gstatus show `git status`
" - <C-n>/<C-p> next/prev file
" - - add/reset file under cursor
" - ca :Gcommit --amend
" - cc :Gcommit
" - D : Gdiff
" - :Gcommit for committing
" - :Gblame run blame on current file
Plug 'tpope/vim-fugitive'

Plug 'KabbAmine/vCoolor.vim'
Plug 'lilydjwg/colorizer'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'vim-test/vim-test'

" Plug 'francoiscabrol/ranger.vim'
Plug 'kevinhwang91/rnvimr'

Plug 'evanleck/vim-svelte'
Plug 'mattn/emmet-vim'

Plug 'udalov/kotlin-vim'

" :: Scala ::
" Scala syntax highlighting and formatting
Plug 'derekwyatt/vim-scala'
" Auto format scala code on save
Plug 'rompetroll/vim-scalariform'

" :: Rust ::
Plug 'rust-lang/rust.vim'

" :: Typescript ::
" Highlighting and indent support
Plug 'HerringtonDarkholme/yats.vim'

" JS highlighting and indent support. Sometimes buggy, but has support for
" jsdocs and flow
" Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Golang autocompletion daemon compatible with nvim-completion-manager.
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.vim/plugged/gocode/nvim/symlink.sh' }

" Python
Plug 'Yggdroot/indentLine', {'for': 'python'}

"" Web
" Mustache and Handlebars
Plug 'mustache/vim-mustache-handlebars'

"" Vue
Plug 'posva/vim-vue'

"" Terraform
Plug 'hashivim/vim-terraform'


"" CSV files
Plug 'mechatroner/rainbow_csv'

"" Markdown Preview
"   Commands
"   :MarkdownPreview
"   :MarkdownPreviewStop
"
"   https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Dart
Plug 'dart-lang/dart-vim-plugin'

" All of your Plugs must be added before the following line
call plug#end()              " required

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

" Use neovim live substitution
set inccommand=split

"" Gruvbox dark scheme
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'

" tabline
let g:buftabline_show=1

" ranger
nnoremap <silent> <leader>f :RnvimrToggle<CR>
let g:rnvimr_enable_picker = 1

" close preview window after completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" --------------------
" nerdcommenter
" --------------------
let g:NERDSpaceDelims = 1 "jump in one step after delimiter


" --------------------
" Multiple curstors - a little hack to make it work naturally with deoplete
" --------------------
function Multiple_cursors_before()
  let g:deoplete#disable_auto_complete = 1
endfunction
function Multiple_cursors_after()
  let g:deoplete#disable_auto_complete = 0
endfunction


inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
inoremap <expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()



" 2020-10-21
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" end

" IMPORTANTE: :help Nce2PopupOpen for more information
set completeopt=noinsert,menuone,preview,noselect

" Required for operations modifying multiple buffers like rename.
set hidden


" --------------------
" coc
" --------------------
" better display for messages
set cmdheight=2
set shortmess=aFc
set updatetime=300
" set updatetime=300

" Show autocomplete when Tab is pressed
" inoremap <silent> <expr> <Tab> coc#refresh()
" <leader>ld to go to definition
nmap <leader>ld <Plug>(coc-definition)
" <leader>li to go to implementation
nmap <leader>li <Plug>(coc-implementation)
" <leader>lt to go to type definition
nmap <leader>lt <Plug>(coc-type-definition)
" <leader>lu to go show references
nmap <leader>lr <Plug>(coc-references)
" <leader>lr to rename variable under cursor
nmap <leader>rn <Plug>(coc-rename)
" <leader>lh for type info under cursor
" nmap <leader>lh <Plug>(coc-doHover)
" <leader>lc Find symbol of current document
nmap <leader>lo :<C-u>CocList outline<cr>
" <leader>ls search workspace symbols
nmap <leader>ls :<C-u>CocList -I symbols<cr>
" <leader>lf format selected region
vmap <leader>lf <Plug>(coc-format-selected)
nmap <leader>lf <Plug>(coc-format-selected)

" <leader>or organize imports
nmap <leader>or :call CocAction('runCommand', 'editor.action.organizeImport')<cr>

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> <leader>lE <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>le <Plug>(coc-diagnostic-next)

" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

nnoremap <silent> <leader>la :CocAction<CR>

function! s:show_documentation()
if &filetype == 'vim'
  execute 'h '.expand('<cword>')
else
  call CocAction('doHover')
endif
endfunction

" Coc cSpell
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

let g:coc_global_extensions = ['coc-spell-checker',
  \'coc-snippets',
  \'coc-prettier',
  \'coc-pairs',
  \'coc-jest',
  \'coc-eslint',
  \'coc-emmet',
  \'coc-cspell-dicts',
  \'coc-yaml',
  \'coc-vetur',
  \'coc-tsserver',
  \'coc-svelte',
  \'coc-rust-analyzer',
  \'coc-pyright',
  \'coc-lua',
  \'coc-json',
  \'coc-java',
  \'coc-go',
  \'coc-css',
  \'coc-cmake',
  \'coc-clangd',
  \'coc-diagnostic']
" Use coc-pyright instead of coc-python

""" Vim-Test
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

" --------------------
" React
" --------------------
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" --------------------
" ultisnips
" --------------------
let g:UltiSnipsSnippetsDirectories=["~/.config/nvim/UltiSnips"]
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsExpandTrigger="<Plug>(ultisnips_expand_or_jump)"
let g:UltiSnipsJumpForwardTrigger="<Plug>(ultisnips_expand_or_jump)"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

function! UltiSnipsExpandOrJumpOrTab()
  call UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return ""
  else
    return "\<Tab>"
  endif
endfunction

" --------------------
" gitgutter
" --------------------
nmap <leader>hn <Plug>(GitGutterNextHunk)
nmap <leader>hp <Plug>(GitGutterPrevHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)

" --------------------
" Use FZF instead of CtrlP - but keep Ctrl-P keybinding
" --------------------
nmap <C-p> :FZF -i<CR>
" --------------------
" Make the FZF popup window easier to read
" --------------------
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }

" <leader>s for Rg search
noremap <leader>s :Rg<CR>

" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

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
" Use both indent fold and manual folding
" augroup vimrc
  " au BufReadPre * setlocal foldmethod=indent
  " au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
" augroup END

" Quickly open a shell below current window
nnoremap <leader>sh :below 10sp term://$SHELL<cr>

nnoremap <leader>tt :TagbarToggle<cr>

" au BufRead,BufNewFile *.svelte set filetype=html

" Gnuplot
au BufRead,BufNewFile *.plt set filetype=gnuplot
au BufRead,BufNewFile *.gp set filetype=gnuplot
au BufRead,BufNewFile *.pt set filetype=gnuplot

" Avro
au BufRead,BufNewFile *.avsc set filetype=json

" wiki
nnoremap <leader>ww :edit ~/Documents/notes/docs/index.md<CR>

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'scala',
    \ 'sro'       : '.',
    \ 'kinds'     : [
      \ 'p:packages',
      \ 'T:types:1',
      \ 't:traits',
      \ 'o:objects',
      \ 'O:case objects',
      \ 'c:classes',
      \ 'C:case classes',
      \ 'm:methods',
      \ 'V:values:1',
      \ 'v:variables:1'
    \ ]
\ }

let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
        \'n:tests',
    \]
\}

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'V:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

set statusline+=%{gutentags#statusline()}

"""" Abbreviations
iab servcie service
iab serivce service
iab improt import
iab publci public
iab isntall install

cnoreabbrev buffers Buffers
