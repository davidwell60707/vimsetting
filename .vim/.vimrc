set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" For better bundle
Bundle 'gmarik/vundle'
" Great tool for auto-completion of variables and functions
Bundle 'Valloric/YouCompleteMe'
" Fuzzy Search of files in repository|file directory. Super handy!!
Bundle 'kien/ctrlp.vim'
" Pretty status bar
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " Enable filetype-specific plugins



if has("gui_running")   " GUI color and font settings
    set guifont=Monaco:h18
    set background=dark 
    set t_Co=256          " 256 color mode
    set cursorline        " highlight current line
    colors moria
    highlight SpellBad term=underline gui=undercurl guisp=Orange 
else
    set t_Co=256
    color yen3
endif

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

set ttyfast
syntax enable 
set number

set nocompatible        " not compatible with the old-fashion vi mode
set ruler               " show the cursor position all the time
set autoread            " auto read when file is changed from outside

set ofu=syntaxcomplete#Complete

""" set encoding to UTF-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set termencoding=utf-8
set ambiwidth=double

set title
set showmode            " Show current input mode in status line
set cursorline         " Show Cursor Line in Underline
"set showtabline=2
set wildmenu " Show autocomplete menus.
set visualbell

""" Search Setting
set showcmd
set incsearch
set showmatch

set hls

""" set status bar
set laststatus=2
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
set statusline+=%{&fileformat}]%m " file format
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
highlight User1 cterm=NONE ctermfg=203 ctermbg=NONE
highlight User2 term=underline cterm=underline ctermfg=77     ctermbg=NONE
highlight User3 term=underline cterm=underline ctermfg=247    ctermbg=NONE
highlight User4 term=underline cterm=underline ctermfg=white  ctermbg=NONE
highlight User5 ctermfg=87
highlight User6 ctermfg=254

""" set folding
"set foldnestmax=3
"set foldmethod=syntax
"set foldcolumn=4

""" Set editing Tab
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=4
set tabstop=2
set smarttab            " insert tabs on the start of a line according to context
set backspace=indent,eol,start 
set copyindent         " copy the previous indentation on autoindenting

" disable sound on errors
set noerrorbells
set novisualbell
"set t_vb=
set tm=500


""" set help doc
"helptags $HOME/.vim/doc 


""" Key Mapping
nmap <LEADER>nt :NERDTree<CR>
nmap <LEADER>tt :TagbarToggle<CR>
nmap <silent><F4> :SrcExplToggle<CR>
nmap <silent><F6> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q && cscope -bR<CR>
nmap <silent><F7> :set foldmethod=syntax<CR>

""" Tab Setting
nmap <LEADER>tc :tabnew<CR>
nmap <LEADER>te :tabedit<SPACE>
nmap <LEADER>tm :tabmove<SPACE>
nmap <LEADER>tk :tabclose<CR>
nmap <C-H> :tabprev<CR>
nmap <C-L> :tabnext<CR>

autocmd TabLeave * let g:LastUsedTabPage = tabpagenr()
function! SwitchLastUsedTab()
    if exists("g:LastUsedTabPage")
        execute "tabnext " g:LastUsedTabPage
    endif
endfunction

nmap tt :call SwitchLastUsedTab()<CR>

""" 讓我們可以使用 tab 來縮排
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm'\"")|else|exe "norm $"|endif|endif

""" Auto remove each line-end space 
autocmd FileType c,cpp,java,php,perl,python,ruby,sh,v,tex autocmd BufWritePre  :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))


nmap <leader>g :Ack<CR>


nmap <leader>m :make -j4<cr>
nmap <leader>, :make clean<cr>
nmap <leader>q :SQFix<cr>

" open the error console
nmap <leader>cc :botright cope<CR> 
"move to next error
nmap <leader>] :cn<CR>
" move to the prev error
nmap <leader>[ :cp<CR>


com! -bang -nargs=? SQFix cal QFixToggle(<bang>0)
fu! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
        unlet g:qfix_win
    else
        copen 10
        let g:qfix_win = bufnr("$")
        en
    endf


""" Tagbar plugin setting
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30

""" NERDTree plugin setting
let NERDTreeWinSize = 20

""" YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"

set tags=~/Ruckus/ZDML/tags

"syntax match English /[!-~]/ contains=@spell
"syntax match Normal /[^!-~]/ contains=@nospell
