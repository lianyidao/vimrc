""" BASIC
set nocompatible    " no vi-compatible mode
set noexrc          " do not use .vimrc in current directory
set noerrorbells    " don't make noise

set fileformats=unix,dos,mac    " support all three, in this order
set iskeyword+=_,$,@,%,#        " none of there are word dividers

set hidden
set nobackup
set nowritebackup



""" UI
set bg=dark         " use a dark backgroud
syntax on           " syntax highlighting on

set ttyfast         " Improves speed of drawing and smoothness of scrolling
set lazyredraw      " Draw more judiciously, don't redraw while running macros

set cursorcolumn    " highlight current column
set cursorline      " highlight current line
set incsearch       " highlight as you type search phrase
set nohlsearch      " don't highlight seached phrases
set linespace=0     " don't insert any extra space between rows
set matchtime=5     " how many tenth of a second to blink for matched brachets

set novisualbell    " don't blink
set visualbell t_vb=
au GuiEnter * set visualbell t_vb=

set number          " show line number
set noshowmode      " don't show the current mode, already displayed by airline
set list            " show tabs, to ensure we get them out of files
set listchars=tab:>-,trail:-    " show tab and trailing white spaces
set nostartofline   " leave cursor column where it was
set report=0        " tell us when any is changed via :...
set scrolloff=10    " keep 10 lines in top/buttom when moving cursor
set sidescrolloff=10
set shortmess=acOstT " shorten messages to avoid 'press a key' prompt

set wildmenu        " turn on vim command line completion, with tab
set showcmd         " Show incomplete commands as I type

set laststatus=2
set statusline=%F%m%r%h%w[%L][%{&enc}][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |     |        |      |  |     |    |
"              | | | | |  |     |        |      |  |     |    + current
"              | | | | |  |     |        |      |  |     |       column
"              | | | | |  |     |        |      |  |     +-- current line
"              | | | | |  |     |        |      |  +-- current % into file
"              | | | | |  |     |        |      +-- current syntax in
"              | | | | |  |     |        |          square brackets
"              | | | | |  |     |        +-- current fileformat
"              | | | | |  |     +-- current encoding
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- modified flag in square brackets
"              +-- full path to file in the buffer
set statusline^=%{coc#status()}


""" TEXT FORMATING/INDENT/ALIGNMENT
set ignorecase      " case insensitive by default
set infercase       " infer case by default
set smartcase       " when there are caps, go case-sensitive
set textwidth=80    " 80 column
let &colorcolumn="81,81"
set shiftround      " when at 3 spaces, hit > ... go to 4, not 5

set autoindent
set smartindent
set backspace=indent,eol,start  " make backspae more flexible

set tabstop=8       " real tabs should be 8
set shiftwidth=4    " auto-indent amount when using cindent(>>, <<)
set softtabstop=4   " how many spaces should a tab be,
                    " when hitting tab or backspace
set expandtab       " no real tabs, insert space instead

" c
set cino=:0g0t0(0   " c code style, see :help cino
au BufNewFile,BufRead *.h,*.hpp,*.c,*.cpp,*.cc,*.objc,*.objcpp
    \ set shiftwidth=8 |
    \ set softtabstop=8 |
    \ set noexpandtab

" html
au BufNewFile,BufRead *.js,*.html,*.css
    \ set shiftwidth=2
    \ set softtabstop=2

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


""" ENCODING
set encoding=utf-8
"set encoding=euc-cn    " use chinese encoding
let &termencoding=&encoding
set fileencodings=utf-8,gb2312,gbk,gb18030


" FOLDING
set foldmethod=syntax
set foldenable
set foldcolumn=0
set foldlevelstart=20

set updatetime=300     " idle mili seconds before swap is written to file

" Enable mouse
"set mouse=a
"set mousemodel=popup_setpos

" GUI menus
set guioptions-=m " Menu
set guioptions-=T " Toolbar
set guioptions-=r " Right scroll
set guioptions-=R " Right scroll
set guioptions-=l " Left scroll
set guioptions-=L " Left scroll
set guioptions+=c " Use console to prompt questions


let mapleader=","

" GUI tabs
"nnoremap <leader>t <Esc>:tabnew<CR>
"nnoremap <C-l> :tabn<CR>
"nnoremap <C-h> :tabp<CR>
"nnoremap <silent> <C-j> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"nnoremap <silent> <C-k> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>


" Work around an issue with C-h on OS X
"if has('nvim')
"  nmap <BS> :tabp<CR>
"endif

" Allow a lot of tabs to be opened by -p
"set tabpagemax=50

" Allow tab duplication
"function! s:copy_tab()
"  tabnew %:p
"endfunction!
"nnoremap ,T <Esc>:call <SID>copy_tab()<CR>


" Unixy pasting
"noremap! <s-insert> <middlemouse>

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Font
let os = substitute(system('uname'), "\n", "", "")
if os != "Darwin"
  if has('nvim') && exists('g:GuiLoaded')
    exec "Guifont Monospace:h17"
  else
    set guifont=Monospace\ 17
  endif
else
  set guifont=Menlo\ Regular:h25
endif


" Enter in the quickfix window doesn't focus the new buffer.
" This is convenient for quickly looking at code and following the
" quickfix buffer without having to manually switch back.
au BufReadPost quickfix noremap <C-cr> <cr><c-w>p

" Allow escaping terminal mode.
tnoremap <C-Esc> <C-\><C-n>
" Make terminal windows as big as possible.
set termwinscroll=100000
au BufWinEnter * if &buftype == 'terminal' | exec "resize " . &lines | endif

" Open help in a new tab
"cabbrev help tab help
"cabbrev h tab h
