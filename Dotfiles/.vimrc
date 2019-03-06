" File: ~/.vimrc
" Author: Bhishan Poudel
" Date: July 23, 2017
" Last Update: June 5, 2018
"
"
"                 ( O O )
"  +-----------oOO--(_)--OOo--------------------+
"  |                                            |
"  |    °v°   Author    : Bhishan Poudel        |
"  |   /(_)\  Contact ✉ :  bhishanpdl@gmail.com |
"  |    ^ ^                                     |
"  +--------------------------------------------+
"
"
"
"
" ******************************************************************************
" ========================  Settings for Vundle ================================
" ******************************************************************************
" Brief help
" Inside vim:  so ~/.vimrc
" NOTE: from terminal source ~/.vimrc will not work, this is not a shell script!
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :help key-notation - gives keyboard notations in vim M = alt, D=cmd, C=ctrl
" vim --version     - gives -clipboard (default vim is /usr/bin/vim)
" vi --version      - gives +clipboard +python3  vi is /opt/local/bin/vim)




" ******************************************************************************
" ========================  Settings for Vundle ================================
" ******************************************************************************
set nocompatible              " required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required








" ******************************************************************************
" =========================  Additional Plugins ================================
" ******************************************************************************
Plugin 'wakatime/vim-wakatime' " For wakatime
Plugin 'yegappan/mru'   " most recently used files  type   :MRU  then hit enter.
Plugin 'terryma/vim-multiple-cursors' " Multiple cursor support
Plugin 'tpope/vim-surround.git' " Surround string by quotes etc.
Plugin 'scrooloose/nerdtree' " very nice file browser
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
Plugin 'L9' " prereq for FuzzyFinder
Plugin 'FuzzyFinder'
Plugin 'tmhedberg/SimpylFold' " Code folding
Plugin 'kien/ctrlp.vim'  " path searching
Plugin 'bronson/vim-visual-star-search'
Plugin 'mechatroner/rainbow_csv' "cursor at , then :RainbowDelim





" ******************************************************************************
" ================================  Numbers ====================================
" ******************************************************************************
"
" To add two numbers:    !dc -e '1 3.0 + p'      use reverse polish notation.
"
" https://github.com/m1foley/vim-expresso
"evaluate numbers in vim
"g=  evalueates seleted in visual mode
"g=$ eval text from cursor to end of line.
Plugin 'm1foley/vim-expresso' " select in visual mode and eval number  (1+3.5)  type g=






" ******************************************************************************
" =============================== Others =======================================
" ******************************************************************************
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} " Zen coding
"Plugin 'git://git.wincent.com/command-t.git' " Does not work, too much depn
" Plugin 'https://github.com/scrooloose/syntastic.git' " linting/error checking.
" Plugin 'ervandew/supertab'
Plugin 'thinca/vim-quickrun'  " Run script inside vim (slow)
Plugin 'kshenoy/vim-signature' " Show marks (dwn frm git and copy to path, shows err but works)
"Plugin 'Gundo'
Plugin 'triglav/vim-visual-increment' "select column in visual mode, then c-a will increment nums 



" ******************************************************************************
" =============================== Colored Parens ==============================
" ******************************************************************************
Plugin 'kien/rainbow_parentheses.vim' " Works for py and c but all are red
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]











" ******************************************************************************
" =============================== Github =======================================
" ******************************************************************************
" Plugin 'tpope/vim-fugitive' " For github






" ******************************************************************************
" =============================== Markdown =====================================
" ******************************************************************************
" Plugin 'godlygeek/tabular'  " The tabular plugin must come before vim-markdown.
" Plugin 'https://github.com/plasticboy/vim-markdown.git'
" Plugin 'jtratner/vim-flavored-markdown'
" Plugin 'suan/vim-instant-markdown'
" Plugin 'nelstrom/vim-markdown-preview'






" ******************************************************************************
" =============================== Comment ======================================
" ******************************************************************************
" Press and hold Leader key \ (back slash) the type these letters:
" cc = comment
" c space toggle
" ci togggle
" cs sexy comment
" cu uncomment
Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"comment and uncommenting using \c and \u.
"vmap \c :s/^\(\s*\)\(\S\+\)/\1#\2<Enter>:nohl<Enter>
"vmap \u :s/#/<Enter>:nohl<Enter>

"nmap \c :s/^\(\s*\)\(\S\+\)/\1#\2<Enter>:nohl<Enter>
"nmap \u :s/#/<Enter>:nohl<Enter>






" ******************************************************************************
" ====================== Copy to clipboard =====================================
" ******************************************************************************
" Install vim using port: sudo -H port install vim +x
" alias vi="/opt/local/bin/vim"  put this in bashrc
" ctrl-c will copy the selected text in visual mode.
"
" :4,8!pbcopy will copy lines 4-8
" set clipboard=unnamed "make sure vim --version has +clipboard not -clipboard
" set pastetoggle=<F3> " Then use cmd-c cmdv in insert mode.
"
"This works in insert mode.
" vnoremap <D-c> :w !pbcopy<CR><CR>    "In Mac D is command Key
" noremap <D-v> :r !pbpaste<CR><CR>
"
" This did not work in visual mode.
" We have to do "*y   to copy in visual mode.
"
"noremap <Leader>y "*y "In visual mode, use mouse to select text, \y will copy text to clipboard
"noremap <Leader>p "*p
"noremap <Leader>Y "+y
"noremap <Leader>P "+p

" https://stackoverflow.com/questions/11489428/how-to-make-vim-paste-from-and-copy-to-systems-clipboard
set clipboard+=unnamed  " use the clipboards of vim and win
set paste               " Paste from a windows or from vim
set go+=a               " Visual selection automatically copied to the clipboard

" ******************************************************************************
" ====================== Display settings ======================================
" ******************************************************************************
" display settings
set number              " Show line numbers
set ruler               " Show file stats
set showcmd             " show command in bottom bar
set showmode            " show mode
set showmatch           " highlight matching brackets
" set list                " show invisibles
hi MatchParen cterm=none ctermbg=green ctermfg=blue
" Toggle show/hide invisible chars
nnoremap <leader>I :set list!<cr>




" ******************************************************************************
" ====================== Edit settings ======================================
" ******************************************************************************
set tabstop=4           " number of visual spaces per TAB
set wildmenu            " visual autocomplete for command menu
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent
set textwidth=80        " wrap lines automatically at 80th column
set encoding=utf-8      " Encoding
set confirm             " ask to save unchaged file
set mouse=a             " Enable use of the mouse for all modes
set backspace=2         " Make backspace work in insert mode
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set noswapfile "I don't like swap files
set autowrite " automatic write when moving to new file in vim
set autoread                    " automatically reload files changed outside of Vim
set updatetime=1000             " Speed up the updatetime so gitgutter and friends are quicker





" ******************************************************************************
" ====================== Indents and tabs ======================================
" ******************************************************************************
filetype plugin indent on "Nerd commenter needs this.
set shiftwidth=4     " spaces for each step of (auto)indent
set softtabstop=4    " set virtual tab stop (compat for 8-wide tabs)
set tabstop=4        " for proper display of files with tabs
set cursorline       "show a visual line under the cursor's current line
" set shiftround       " always round indents to multiple of shiftwidth
" set copyindent       " use existing indents for new indents
" set preserveindent   " save as much indent structure as possible
" set autoindent           " set the cursor at same indent as line above
" set smartindent      " try to be smart about indenting (C-style)
"set expandtab        " DO NOT USE THIS:  expand <Tab>s with spaces; death to tabs!





" ******************************************************************************
" ============================== Backups  ======================================
" ******************************************************************************
try

    set backup                    "set backup
    set backupdir=~/.vim/backup   "needs ~/.vim/backup
    set directory=~/.vim/tmp      "needs ~/.vim/tmp
catch
endtry





" ******************************************************************************
" ========================== Color Scheme ======================================
" ******************************************************************************
" To see installed colorschemes       :colorscheme space then tab
"
"
"colorscheme solarized  " needs ~/.vim/colors/solarized.vim
"set background=dark    " dark background for console
syntax on
try
	color Tomorrow-Night
catch
endtry

autocmd BufEnter *.c colorscheme VisualStudioDark



" ******************************************************************************
" ====================== Search Settings =======================================
" ******************************************************************************
set hlsearch           " highlight search results
set ignorecase         " do case insensitive search...
set incsearch          " do incremental search
set smartcase          " ...unless capital letters are used
:noh                   "turn off highlighting until next
nnoremap <F3> :set hlsearch!<CR>  "toggle highlighting






" ******************************************************************************
" ========================== Error Bells =======================================
" ******************************************************************************
set noerrorbells
set visualbell
set t_vb=





" ******************************************************************************
" ============================== Keymaps =======================================
" ******************************************************************************
" vnoremap <F5> :sort i<CR>     " press F5 to sort selection or paragraph
" nnoremap <F5> Vip:sort i<CR>
" noremap <F8> :nohl<CR> "F8 to turn the search results highlight off
" inoremap <F8> <Esc>:nohl<CR>a
" noremap <F12> :set list!<CR> "F12 to toggle showing the non-printable charactes
" inoremap <F12> <Esc>:set list!<CR>a
"
"Go to middle of the line.
map gm :call cursor(0, virtcol('$')/2)<CR>  "gm will go to middle of line
"
" Insert new line
nmap oo o<Esc>k "insert new line without going to insert mode.
"
" Copy file paths
" \f   copies full path
" ,cl  copies full path
" ,cs  copies filename
nnoremap <leader>f :let @+=expand('%:p')
nmap ,cs :let @+=expand("%")<CR>
nmap ,cl :let @+=expand("%:p")<CR>






" ******************************************************************************
" ============================== Wild Ignores ==================================
" ******************************************************************************
" let g:ctrlp_map = '<c-p>'
" nmap <silent> <C-D> :NERDTreeToggle<CR>
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*node_modules*








" ******************************************************************************
" ====================== Code snippets completion   ============================
" ******************************************************************************
Plugin 'MarcWeber/vim-addon-mw-utils' "snipmate needs this
Plugin 'tomtom/tlib_vim' "snipmate needs this
Plugin 'garbas/vim-snipmate' " This works for macpro
set rtp+=~/.vim "add runtimepath
"let g:SnipMateExpandTrigger="<tab>"               " expandtrigger
"let g:SnipMateJumpForwardTrigger="<tab>"          " advance to next tabstop
"let g:SnipMateJumpBackwardTrigger="<s-tab>"       " reverse to previous tabstop







" ******************************************************************************
" ========================== Split Navigation   ================================
" ******************************************************************************
nnoremap <C-J> <C-W><C-J> " Ctrl-j move to the split below
nnoremap <C-K> <C-W><C-K> " Ctrl-k move to the split above
nnoremap <C-L> <C-W><C-L> " Ctrl-l move to the split to the right
nnoremap <C-H> <C-W><C-H> " Ctrl-h move to the split to the left
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>
"
" Usage:
" :args vehicle.c vehicle.h car.c car.h jet.c jet.h jetcar.c jetcar.h
" :b <Tab>       " offers all buffers in a menu
" :b car<Tab>    " offers car.c car.h
" :b *car<Tab>   " offers car.c jetcar.c car.h jetcar.h
" :b .h<Tab>     " offers the *.h buffers
" :b .c<Tab>     " offers the *.c buffers
" :b ar.c<Tab>   " offers car.c jetcar.c
" :b j*c<Tab>    " offers jet.c jetcar.c jetcar.h
"
"  Ref:
"  http://vim.wikia.com/wiki/Easier_buffer_switching?li_source=LI&li_medium=wikia-footer-wiki-rec
" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P






" ******************************************************************************
" ================================= Python    ==================================
" ******************************************************************************
autocmd! FileType python nnoremap <buffer> <F7> :exec '!python' shellescape(@%, 1)<cr>
autocmd! FileType python nmap ,r :!clear; python %<CR>
command! -nargs=* Py !python % <args>
au BufRead,BufNewFile *py,*pyw,*.c,*.h 
    \ set encoding=utf-8 |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ highlight BadWhitespace ctermbg=red guibg=red |
    \ match BadWhitespace /\s\+$/ |
    \ match BadWhitespace /\s\+$/ |
    \ let python_highlight_all=1 |
    \ syntax on |
    \ autocmd FileType python set foldmethod=indent |
    \ nnoremap <space> za "set space to open fold






" ******************************************************************************
" ========================== Auto command ======================================
" ******************************************************************************
" This will add header for new c program files.
" To use autocmd: check vi --version it should have +autocommand

if has("autocmd")
augroup content
autocmd bufnewfile *.c
    \ so /Users/poudel/.vim/autocmd/c_header.txt |
    \ exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%") |
    \ exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%m-%d-%Y")
autocmd Bufwritepre,filewritepre *.c 
    \ execute "normal ma" |
    \ exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c") |
    \ execute "normal `a"
augroup END
endif


if has("autocmd")
augroup content
autocmd bufnewfile *.py
    \ so /Users/poudel/.vim/autocmd/py_header.txt |
    \ exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%") |
    \ exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%m-%d-%Y")
autocmd Bufwritepre,filewritepre *.py
    \ execute "normal ma" |
    \ exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c") |
    \ execute "normal `a"
augroup END
endif







" ******************************************************************************
" ========================== Dictionary Completion   =============================
" ******************************************************************************
" Use Ctrl n  to see the dictionary suggestions. 
" 
"
" set dictionary+=/usr/share/dict/words
" set thesaurus+=/Users/poudel/.vim/dict/mthesaur.txt
" set complete=.,w,k
" set infercase
"
" The plugin word_complete is too interferring.
Plugin 'vim-scripts/word_complete.vim'" If you use this turn off dict.
autocmd BufEnter * call DoWordComplete()  " :call DoWordComplete()
"
"Another plugin
" This does not work, needs vim compiled with +python.
" Plugin 'lifepillar/vim-mucomplete'  "Download from github and put in vim
" set completeopt+=menuone
" set completeopt+=noselect
" set completeopt+=noinsert
" set shortmess+=c   " Shut off completion messages
" set belloff+=ctrlg " If Vim beeps during completion
" let g:mucomplete#enable_auto_at_startup = 1  ":MUcompleteAutoToggle


" ******************************************************************************
" ========================== Remapping vim words   =============================
" ******************************************************************************
" map :w :up ":w will update timestamp even when file not changed
" :map :q :confirm q "confirm before quit




" ******************************************************************************
" ========================== Abbreviations   ===================================
" ******************************************************************************
ab usa United States of America





" ******************************************************************************
" ========================== Functions   ===================================
" ******************************************************************************
" " Deletes line below with backspace
function! DeleteUnder()
   let save_cursor = getpos(".")
   normal j
   normal dd
   call setpos(".", save_cursor)
endfunction
nnoremap <Leader><Backspace> :call DeleteUnder()<CR>

" Delete line above without moving the cursor
" https://vi.stackexchange.com/a/8368/7339
function! DeleteLineAbove()
    if line('.') == 1
        echom "You are at the first line!"
        return
    endif
    let l:colsave = col(".")
    exec  "normal! kdd"
    call cursor(line("."), l:colsave)
endfunction
nnoremap <Leader>k :call DeleteLineAbove()<CR>




" ******************************************************************************
" ============================== Commands    ===================================
" ******************************************************************************
"
" command py !python %   " py    will run current python script




" ******************************************************************************
" ============================== Latest    ===================================
" ******************************************************************************
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap <leader><space> :noh<cr>
" let mapleader = ","  " change leader key \
au FocusLost * :wa  "autosave when go to new tab and any other place.
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR> "strip all trailing whitespace in the current file
nnoremap <leader>v V`] "reselect the text that was just pasted
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr> "edit vimrc file.
inoremap jj <ESC> "use also another key jj to go to normal mode from insert mode.



" ******************************************************************************
" ==============================For newcomers avoid arrows =====================
" ******************************************************************************
"
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" also disable arrows in insert mode
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"
" map j to gj and k to gk
nnoremap j gj
nnoremap k gk
" Quote words under cursor
" nnoremap <leader>" viW<esc>a"<esc>gvo<esc>i"<esc>gvo<esc>3l
nnoremap <leader>' viW<esc>a'<esc>gvo<esc>i'<esc>gvo<esc>3l

" Quote current selection
" TODO: This only works for selections that are created "forwardly"
vnoremap <leader>" <esc>a"<esc>gvo<esc>i"<esc>gvo<esc>ll
vnoremap <leader>' <esc>a'<esc>gvo<esc>i'<esc>gvo<esc>ll




" ******************************************************************************
" ===================================== Latest =================================
" ******************************************************************************
nmap <F8> o<Esc> "F8 to insert new line
nmap <F9> O<Esc>
