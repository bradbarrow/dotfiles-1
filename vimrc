call pathogen#infect()

" Smart indenting when starting new line
set smartindent

" Indent with two spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Show line numbers
set number

" Show line and column number
set ruler

" Color scheme
set background=dark
colorscheme jellybeans
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

" Highlight the screen line of the cursor, easier to find the cursor.
set cursorline

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

" Custom file-to-syntax highlighting schemes
au BufNewFile,BufRead *.jbuilder set filetype=ruby

" Treat things like @foo in ruby files as keywords
au BufNewFile,BufRead *.rb setlocal iskeyword+=@-@

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
autocmd! bufwritepost .vimrc source %

" blowfish encryption TODO more secure
set cm=blowfish

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

" insert a real tab character
inoremap <S-Tab> <C-V><Tab>

" checksyntax: auto-check Ruby files on save.
if !exists('g:checksyntax')
  let g:checksyntax = {}
  let g:checksyntax['ruby'] = {'auto': 1, 'prepare': 'compiler ruby', 'cmd': 'ruby -c', 'okrx': 'Syntax OK\|No Errors'}
endif

" Di-paste
nnoremap <leader>p :r !pbpaste<CR>

" run the current file with rspec
" nnoremap <leader>r :w\|:call Send_to_Tmux("rspec -f d " . @% . "\n")<CR>
" set a file to run with rspec
nnoremap <leader>T :let g:spec_file = @%<CR>
" run the set spec file
nnoremap <leader>t :w\|:call Send_to_Tmux("clear && be rspec -f d " . g:spec_file . " \n")<CR>

nnoremap <leader>h :w\|:call Send_to_Tmux("clear && runhaskell " . g:spec_file . " \n")<CR>

"nnoremap <leader>r :w\|:call Send_to_Tmux("clear && ./index_xml.rb nodejs/chap*.xml\n")<CR>
"nnoremap <leader>l :w\|:call Send_to_Tmux("clear && ruby script/test_lint.rb\n")<CR>
"nnoremap <leader>r :w\|:call Send_to_Tmux("clear && be ruby script/ungoliant_benchmark.rb\n")<CR>
nnoremap <leader>r :w\|:call Send_to_Tmux("clear && ./merry.rb index --files nodejs/chap_*.xml -r\n")<CR>

