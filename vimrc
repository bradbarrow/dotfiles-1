" Disable vi compatibility
set nocompatible

call pathogen#infect()

" load indent file for the current filetype
filetype indent on
filetype plugin on

" Configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

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
colorscheme hybrid
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

" Leader of '\' is too far from home row.
let mapleader = ";"
let g:mapleader = ";"

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

" Custom file-to-syntax highlighting schemes
au BufNewFile,BufRead *.jbuilder set filetype=ruby
au BufNewFile,BufRead *.prawn set filetype=ruby
au BufNewFile,BufRead *.hbs set filetype=html

au BufNewFile,BufRead *.hs compiler ghc

" Keywords
" @foo in ruby
au BufNewFile,BufRead *.rb setlocal iskeyword+=@-@
" #foo in scss
au BufNewFile,BufRead *.scss setlocal iskeyword+=#-#

" Strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" tab navigation
nmap tj :tabprev<CR>
nmap ti :tabnext<CR>
nmap tk :tabnext<CR>
nmap tn :tabnew<CR>

" Quick-edit .vimrc
nnoremap <leader>ev :tabnew<CR>:e $MYVIMRC<cr>

" auto-reload .vimrc after save.
autocmd! BufWritePost .vimrc source %

" move backup files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" Minimum number of lines to keep above/below cursor when scolling
set scrolloff=5

" ctrlp.vim
let g:ctrlp_max_height = 16
let g:ctrlp_custom_ignore = ''
let g:ctrlp_custom_ignore .= '/\..*/\|'
let g:ctrlp_custom_ignore .= '/tmp/\|'
let g:ctrlp_custom_ignore .= '/node_modules/\|'
let g:ctrlp_custom_ignore .= '/vendor/\|'
let g:ctrlp_custom_ignore .= '/dist/\|'
let g:ctrlp_custom_ignore .= '/app/bower_components/\|'
let g:ctrlp_custom_ignore .= 'REGEX_TERMINATOR'
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

" ctrl+c to escape
imap <c-c> <esc>

" checksyntax: auto-check Ruby files on save.
if !exists('g:checksyntax')
  let g:checksyntax = {}
  let g:checksyntax['ruby'] = {'auto': 1, 'prepare': 'compiler ruby', 'cmd': 'ruby -c', 'okrx': 'Syntax OK\|No Errors'}
endif

" selective spell checking
if has('spell')
  " commit messages
  autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
endif

function! PromoteToLet()
  normal! dd
  " :exec '?^\s*it\>'
  normal! P
  .s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  normal ==
endfunction
command! PromoteToLet :call PromoteToLet()
map <leader>p :PromoteToLet<cr>

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" set a file to run with rspec
nnoremap <leader>T :let g:spec_file = @%<CR>
" run the set spec file
nnoremap <leader>t :w\|:call Send_to_Tmux("clear && rspec -f d " . g:spec_file . " \n")<CR>
nnoremap <leader>r :w\|:exec "!rspec -f d " . g:spec_file<CR>
