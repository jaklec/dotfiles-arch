"if !has('nvim') 
  " Basic aut indentation
  set autoindent
  " Atomatically reload mofied files
  set autoread
  " Don't scan included files for keyword completion (SLOW)
  set complete-=i
  " Always use UTF-8. Always!
  set encoding=utf-8
  " Highlight search
  set hlsearch
  " Enable mouse
  set mouse=a
  " Fast scrolling
  set ttyfast
"endif

" Read .vimrc from current dir if present
set exrc
set secure

" Indent settings based on filetype
filetype plugin indent on

" Don't redraw while executing macros
set lazyredraw

" Timeouts
set timeoutlen=1000
set ttimeoutlen=0

" Use system clipboard (xclip on linux)
set clipboard+=unnamed
" Set clipboard=unnamedplus
set go+=a

" Highlight textwidth column
set colorcolumn=+1

" Open new split panes to the bottom
set splitbelow

" Resize splits when the window is resized
augroup on_vim_resized
  autocmd!
  autocmd VimResized * wincmd =
augroup END

" Automatically write files on :next, :make, etc
" set autowriteall

" No pesky backups!
set nobackup
set noswapfile
set nowritebackup

" Search within subfolders
set path+=**
" Ignore folders
set path-=.git,build,target,lib,node_modules,bin
" Ignore generated files
set wildignore+=*.o,*.obj,*.pyc,*.class,*.swp
" Ignore git
set wildignore+=.git
" Ignore common build/lib folders
set wildignore+=build,lib,node_modules,target
" Ignore images and fonts
set wildignore+=*.gif,*.jpg,*.jpeg,*.otf,*.png,*.svg,*.ttf
" Ignore case when completing
set wildignorecase

" C-style indentation
set cindent

" Use spaces for tabs!
set expandtab

" Tab/indentation spaces width
set tabstop=2
set shiftwidth=2
set softtabstop=2

autocmd Filetype kotlin setlocal shiftwidth=4 softtabstop=4 tabstop=4

" Enable tab/enter if completion menu is open
" inoremap <expr> <Tab> (pumvisible() ? "\<C-n>" : "\<Tab>")
" inoremap <expr> <S-Tab> (pumvisible() ? "\<C-p>" : "\<S-Tab>")

" Only break line if it wasn't longer than 8 chars when editing began
" and there is a blank somewhere in the line
set formatoptions+=lb
" Don't continue comments when pressing o/O
set formatoptions-=o
" Recognize numbered lists
set formatoptions+=n
" Wrap at 80 characters
" set textwidth=80
" Side scroll when hitting end of line
set sidescroll=1
" Nice linebreak symbol
set showbreak=↪>\
" Don't default to wrapping
set nowrap
" Eliminate <Press Enter> message
" set shortmess=aoOtI
set shortmess=atI

" Show matching brackets for half a second
set showmatch
set matchtime=5

set number

" Enable syntax highlighting
syntax enable

" Restrict highting width for performance reasons
set synmaxcol=500

" Ignore case, except when using some uppercase
set ignorecase
set smartcase

" Ctags
set tags=./tags,tags

" Use ag instead of grep
if executable('ag')
  " Use smart case, match whole words, and output in vim-friendly format
  set grepprg=ag\ -S\ -Q\ --nogroup\ --nocolor\ --vimgrep
  set grepformat^=%f:%l:%c:%m
endif

" Use space as leader
let mapleader=" "
let maplocalleader=" "

" Remap jj and jk to <ESC>
" inoremap jj <ESC>
" inoremap jk <ESC>

" 
inoremap <C-l> <ESC>A
" Ctrl+j and Ctrl+k as Esc
" Ctrl-j is a little awkward unfortunately:
" https://github.com/neovim/neovim/issues/5916
" So we also map Ctrl+k
nnoremap <C-j> <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
snoremap <C-j> <Esc>
xnoremap <C-j> <Esc>
cnoremap <C-j> <C-c>
onoremap <C-j> <Esc>
lnoremap <C-j> <Esc>
tnoremap <C-j> <Esc>

nnoremap <C-k> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <C-c>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>

" Jump to start and end of line using the home row keys
map H ^
map L $ 

" Move lines (or blocks) up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Use tab and shift-tab to cycle through windows
" nnoremap <Tab> <C-W>w
" nnoremap <S-Tab> <C-W>W

" Easily switch to next buffer
" nnoremap <C-b> :bn<CR>
" nnoremap <A-b> :bp<CR>
nnoremap <A-b> :bn<CR>
nnoremap <S-A-b> :bp<CR>
nnoremap <leader>b :b#<CR>

" Quick open a buffer for scribbling
" nnoremap <leader>q :e ~/scribble <CR>

" Close current buffer without closing the window
noremap <leader>w :bp<bar>sp<bar>bn<bar>bd<CR>

noremap <leader>a :%bd<bar>e#<bar>bd#<CR>

" Toggle relative numbers
noremap <leader>rn :set relativenumber!<CR>

" Toggle fold column
nnoremap <leader>z :call ToggleFoldColumn()<CR>

" Execute current line in bash
nnoremap <leader>r :.w !bash <CR>

function! ToggleFoldColumn()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=1
  endif
endfunction

" Filetype configuration
augroup filetype_tweaks
  autocmd!
  " Scala
  autocmd BufNewFile,BufRead *.sc set filetype=scala

  " Typescript
  autocmd BufNewFile,BufRead *.ts set filetype=typescript

  " Markdown
  autocmd BufNewFile,BufRead *.md set filetype=markdown

  if executable('shellcheck')
    let s:automake_filetypes += ['*.sh']
    autocmd Filetype sh setlocal makeprg=shellcheck\ -x\ -f\ gcc\ %
  endif

  " Use 4 spaces
  autocmd FileType java setlocal shiftwidth=4
  autocmd FileType python setlocal shiftwidth=4
augroup END

set cul

augroup ActiveWindow
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

" Setup netrw to mimic NERDtree
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25

command! Bonly silent! execute "%bd|e#|bd#"


let @f="va{zf"
