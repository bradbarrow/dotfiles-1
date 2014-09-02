" Disable vi compatibility
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

Plugin 'kchmck/vim-coffee-script'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jnwhiteh/vim-golang'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'wlangstroth/vim-haskell'
Plugin 'derekwyatt/vim-scala'
Plugin 'chriskempson/base16-vim'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

if filereadable(expand("~/.vim/functions.vim"))
  source ~/.vim/functions.vim
endif

" load indent file for the current filetype
filetype indent on
filetype plugin on

" Indentation; 2 space default
set smartindent
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Show line numbers
set relativenumber

" Show line and column number
set ruler

" Color scheme
set t_Co=256
set background=dark
colors base16-default
syntax on

" Highlight trailing whitespace etc
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" Ignore case
set ignorecase
set smartcase

" Disable modelines; not used, risk of security exploits.
set modelines=0

" Use visual bell instead of beeping
set visualbell

" Terminals are plenty fast these days.
set ttyfast

" Mapping and escape timeouts.
set timeout
set timeoutlen=1000 " mapped sequences
set ttimeoutlen=10  " escape sequence delay

" highlight search matches
set hlsearch

" Mouse for scrolling etc in console.
set mouse=a

" Resize split panes with mouse within tmux.
" Also get live-updated text selection with mouse drag.
set ttymouse=xterm2

" Navigatable tab completion from Vim command line
set wildmenu
set wildmode=list:longest

" Split to right side
set splitright

" Allow backspacing over indents and start of insertion point.
set backspace=indent,start

" move backup files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" Minimum number of lines to keep above/below cursor when scolling
set scrolloff=5

" Leader of '\' is too far from home row.
let mapleader = ";"
let g:mapleader = ";"

" ctrlp config
let g:ctrlp_max_height = 16
let g:ctrlp_custom_ignore = ''
let g:ctrlp_custom_ignore .= '/\..*/\|'
let g:ctrlp_custom_ignore .= '/tmp/\|'
let g:ctrlp_custom_ignore .= '/project/\|'
let g:ctrlp_custom_ignore .= '/target/\|'
let g:ctrlp_custom_ignore .= 'REGEX_TERMINATOR'

" auto-reload .vimrc after save.
autocmd! BufWritePost .vimrc source %

augroup filetype_settings
  autocmd!
  autocmd BufRead,BufNewFile *.jbuilder,*.prawn setlocal filetype=ruby
  autocmd BufRead,BufNewFile *.hbs setlocal filetype=html
augroup END

augroup tab_settings
  autocmd!
  autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType php setlocal shiftwidth=2 tabstop=2 noexpandtab
augroup END

autocmd FileType ruby setlocal iskeyword+=@-@

autocmd FileType go autocmd BufWritePre <buffer> Fmt

" selective spell checking
if has('spell')
  " commit messages
  autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
endif

" convert 'a = 1' to 'let(:a) { 1 }'
nnoremap <leader>p :PromoteToLet<cr>

" insert a tab or try to complete word
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" ctrl+c to escape in insert mode
inoremap <c-c> <esc>

" Strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" tab navigation
nnoremap tj :tabprev<CR>
nnoremap ti :tabnext<CR>
nnoremap tk :tabnext<CR>
nnoremap tn :tabnew<CR>

" Quick-edit .vimrc
nnoremap <leader>ev :tabnew<CR>:e $MYVIMRC<cr>

" Ctrl+L turns off any highlighted matches
noremap <C-l> :nohlsearch<CR>

nnoremap <leader>gs :CtrlP spec/<cr>
nnoremap <leader>gm :CtrlP app/models/<cr>
nnoremap <leader>gv :CtrlP app/views/<cr>
nnoremap <leader>gc :CtrlP app/controllers/<cr>
nnoremap <leader>ga :CtrlP app/assets/<cr>
nnoremap <leader>gl :CtrlP lib/<cr>
nnoremap <C-b> :CtrlPBuffer<CR>

" Split windows
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s

" Convert to ruby 1.9 hash style
nnoremap <leader>9 xea:<esc>wdw

nnoremap <leader>T :call SetTestFileToCurrentFile()<CR>
nnoremap <leader>t :w\|:call SendCurrentTestToPipe()<CR>
nnoremap <leader>r :w\|:call ModalRunCurrentTest()<CR>
