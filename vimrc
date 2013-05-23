" Disable vi compatibility
set nocompatible

call pathogen#infect()

" Smart indenting when starting new line
set smartindent
set autoindent

" load indent file for the current filetype
filetype indent on

filetype plugin on

" Configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

au BufNewFile,BufRead *.hs compiler ghc

" Indent with two spaces
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
" colorscheme jellybeans
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

" Allow backspacing over indents and start of insertion point.
set backspace=indent,start

" Custom file-to-syntax highlighting schemes
au BufNewFile,BufRead *.jbuilder set filetype=ruby
au BufNewFile,BufRead *.prawn set filetype=ruby

" Treat things like @foo in ruby files as keywords
au BufNewFile,BufRead *.rb setlocal iskeyword+=@-@
au BufNewFile,BufRead *.scss setlocal iskeyword+=#-#

" Strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" tab navigation
nmap tj :tabprev<CR>
nmap ti :tabnext<CR>
nmap tk :tabnext<CR>
nmap tn :tabnew<CR>

" window navigation
"nnoremap wh <C-w>h
"nnoremap wl <C-w>l

" Quick-edit .vimrc
nnoremap <leader>ev :tabnew<CR>:e $MYVIMRC<cr>

" auto-reload .vimrc after save.
autocmd! bufwritepost .vimrc source %

" blowfish encryption
set cm=blowfish

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
let g:ctrlp_custom_ignore .= 'REGEX_TERMINATOR'
nnoremap <leader>gs :CtrlP spec/<cr>
nnoremap <leader>gm :CtrlP app/models/<cr>
nnoremap <leader>gv :CtrlP app/views/<cr>
nnoremap <leader>gc :CtrlP app/controllers/<cr>
nnoremap <leader>ga :CtrlP app/assets/<cr>
nnoremap <leader>gl :CtrlP lib/<cr>
nnoremap <C-b> :CtrlPBuffer<CR>

nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
nnoremap <leader>9 xea:<esc>wdw

" insert a real tab character
inoremap <S-Tab> <C-V><Tab>

imap <c-c> <esc>

" checksyntax: auto-check Ruby files on save.
if !exists('g:checksyntax')
  let g:checksyntax = {}
  let g:checksyntax['ruby'] = {'auto': 1, 'prepare': 'compiler ruby', 'cmd': 'ruby -c', 'okrx': 'Syntax OK\|No Errors'}
endif

" Di-paste
nnoremap <leader>d :r !pbpaste<CR>

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

nnoremap <leader>o :silent !open http://i.imgur.com/RVKUx.gif<cr>\|:redraw!<cr>
nnoremap <leader>n :silent !open "http://gallery.burrowowl.net/index.php?q=/image/24669.jpg"<cr>\|:redraw!<cr>

" set a file to run with rspec
nnoremap <leader>T :let g:spec_file = @%<CR>
" run the set spec file
nnoremap <leader>t :w\|:call Send_to_Tmux("clear && rspec -f d " . g:spec_file . " \n")<CR>
"nnoremap <leader>t :w\|:!rspec -f d %<CR>
nnoremap <leader>r :w\|:exec "!rspec -f d " . g:spec_file<CR>

nnoremap <leader>r :w\|:call Send_to_Tmux("clear && rspec\n")<CR>

nnoremap <leader>h :w\|:call Send_to_Tmux("clear && runhaskell " . g:spec_file . " \n")<CR>

"nnoremap <leader>t :w\|:call Send_to_Tmux("clear && be ./script/ungoliant_benchmark.rb\n")<CR>
