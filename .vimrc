set number   " Show line numbers.
"https://jeffkreeftmeijer.com/vim-numberr
syntax on
" Edit vimr configuration file
nnoremap confe :e $MYVIMRC<CR>
" Reload vims configuration filONON
nnoremap r :source $MYVIMRC<CR>

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on
" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Highlight cursor line underneath the cursor horizontally.
"set cursorline
"
" Highlight cursor line underneath the cursor vertically.
"set cursorcolumn
"
"Set shift width to 4 spaces.
set shiftwidth=2

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as
" you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


" Map the F5 key to run a Python script inside Vim.
" I map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing SHIFT+j, SHIFT+k, SHIFT+h, or SHIFT+l.
nnoremap <s-j> <c-w>j
nnoremap <s-k> <c-w>k
nnoremap <s-h> <c-w>h
nnoremap <s-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" SHIFT+UP, SHIFT+DOWN, SHIFT+LEFT, or SHIFT+RIGHT.
noremap <s-up> <c-w>+
noremap <s-down> <c-w>-
noremap <s-left> <c-w>>
noremap <s-right> <c-w><

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
 nnoremap <F3> :NERDTreeToggle<cr>
"split and vplit keytrokes
noremap <c-w>h :split<cr>
noremap <c-w>v :vsplit<cr>

set mouse=a                       " Enable mouse drag on window splits
set clipboard=unnamedplus         "https://unix.stackexchange.com/questions/12535/how-to-copy-text-from-vim-to-an-external-program




















































" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

  Plug 'dense-analysis/ale'

  Plug 'preservim/nerdtree'

call plug#end()
" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
      autocmd!
          autocmd FileType vim setlocal foldmethod=marker
	augroup END

	" More Vimscripts code goes here.

	" }}}


	" STATUS LINE
	" ------------------------------------------------------------ {{{

	" Status bar code goes here.

	" }}}
