set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
set autoread
syntax on
" Edit vimr configuration file
nnoremap confe :e $MYVIMRC<CR>
" Reload vims configuration filONON
nnoremap r :source $MYVIMRC<CR>

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
"
  Plugin 'preservim/nerdtree'
" entferne trailing whitespaces
  Plugin 'nestorsalceda/vim-strip-trailing-whitespaces'
" statusline
  Plugin 'itchyny/lightline.vim'
" buffer wechseln
  Plugin 'jeetsukumaran/vim-buffergator'
" change icons neben der zeilennummerierung
  Plugin 'mhinz/vim-signify'
" fuzzy finder
  Plugin 'ctrlpvim/ctrlp.vim'
" einrückungsmarkierungen
  Plugin 'Yggdroot/indentLine'
" git integration G:
  Plugin 'tpope/vim-fugitive'
" git integration
  Plugin 'jreybert/vimagit'
" auto einrueckung
  Plugin 'tpope/vim-sleuth'
" zeilen ein/auskommentieren
  Plugin 'tpope/vim-commentary'
" theme
  Plugin 'sickill/vim-monokai'
  Plugin 'euclio/vim-markdown-composer'
  call vundle#end()
filetype plugin indent on
" allgemeine Optionen
set encoding=UTF-8
set undolevels=1000
set smartcase
set gdefault        " global bei suche immer mit an

" line numbers setting
set number   " Show line numbers.
"https://jeffkreeftmeijer.com/vim-numberr
set number relativenumber
"augroup numbertoggle
"    autocmd!
"    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"    augroup END

" toggle linenumbers
nmap <C-w>0 :set norelativenumber!<CR>

" Markdown preview
let g:markdown_composer_autostart = 1
let g:markdown_composer_open_browser = 1

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible
" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on
" Enable plugins and load plugin for the detected file type.
filetype plugin on
" Load an indent file for the detected file type.
filetype indent on
"Set shift width to 2 spaces.
set shiftwidth=2
" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10
" While searching though a file incrementally highlight matching characters as you type.
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
"mouse input
set mouse=a                       " Enable mouse drag on window splits
"https://unix.stackexchange.com/questions/12535/how-to-copy-text-from-vim-to-an-external-program
set clipboard=unnamedplus

"Resize split windows using arrow keys by pressing:
"SHIFT+LEFT, or SHIFT+RIGHT.
noremap <s-left> <c-w><
noremap <s-right> <c-w>>

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>
let NERDTreeShowHidden=1

"split and vplit keytrokes
noremap <c-w>- :split<cr>
noremap <c-w>/ :vsplit<cr>
"new window in vertikal split
noremap <c-w>N :vnew<cr>

" lightline/statusline
set laststatus=2
let g:lightline = {'colorscheme': 'wombat','active': {'left': [ [ 'mode', 'paste' ],[ 'gitbranch', 'readonly', 'filename','modified' ] ]},'component_function': {'gitbranch': 'FugitiveHead'},}

" buffergator
" https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" This allows buffers to be hidden if you've modified a buffer.
" " This is almost a must if you wish to use buffers in this way.
" https://medium.com/usevim/vim-101-set-hidden-f78800142855
set hidden
" öffne buffergator drawer horizontal unten
" https://github.com/jeetsukumaran/vim-buffergator/blob/master/doc/buffergator.txt
let g:buffergator_viewport_split_policy = 'B'
" gibt an wie hoch der drawer sein soll
let g:buffergator_hsplit_size = '10'
" Move to the next buffer
nmap  <C-l> :bnext<CR>
" Move to the previous buffer
nmap  <C-h> :bprevious<CR>
" indentLine
" fügt vertikale Striche bei Einrückungen ein
filetype plugin indent on
" ripgrep und ctrlp
" sudo apt install ripgrep(rg)
if executable('rg')
        let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif
let g:ctrlp_map = '<c-f>' "aufruf mit strg+f
let g:ctrlp_show_hidden = 1
" ignore files
" https://github.com/ctrlpvim/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" vimagit
" https://github.com/jreybert/vimagit#mappings
nmap  <Leader>m :Magit<cr>
let g:magit_discard_untracked_do_delete=1

" Kommandovervollständigung
" https://www.reddit.com/r/vim/comments/oo9gms/any_way_to_get_vim_to_not_defaulting_to_the_first/h5wygix/?context=8&depth=9
set wildmode=longest,list,full
set wildmenu
set wildignore=*.o,*~

set background=dark

"color
"colorscheme molokai
hi NonText 		guifg=#000000 guibg=#000000 gui=none ctermfg=3335 ctermbg=335
hi Normal guifg=#000000 guibg=#000000 gui=none ctermfg=3335 ctermbg=335
hi SignColumn guifg=#000000 guibg=#000000 gui=none ctermfg=3335 ctermbg=335
hi DiffChange  ctermbg=3
hi Delimiter       ctermfg=3335
hi DiffAdd   ctermbg=22 ctermfg=22
hi DiffDelete ctermbg=88
hi FoldColumn    guifg=#000000 guibg=#000000 gui=none ctermfg=2 ctermbg=2
hi Folded guifg=#000000 guibg=#000000 gui=none ctermfg=3335 ctermbg=335

hi CursorColumn guifg=#000000 guibg=#000000 gui=none ctermfg=15 ctermbg=35
"helpfull links:
"http://vimregex.com/
