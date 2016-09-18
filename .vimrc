set autoindent
set nocompatible
" More on YouCompleteMe:
" https://github.com/Valloric/YouCompleteMe/blob/master/README.md
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
"""call vundle#begin()
"call vundle#rc()

" Just one vimrc file for Windows & Linux
let win_shell = (has('win32') || has('win64')) && &shellcmdflag =~ '/'
let vimDir = win_shell ? '$HOME/vimfiles' : '$HOME/.vim'
let &runtimepath .= ',' . expand(vimDir . '/bundle/Vundle.vim')
call vundle#rc(expand(vimDir . '/bundle'))

"execute pathogen#infect()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'davidhalter/jedi-vim'
"Plugin 'mickaobrien/vim-stackoverflow'
filetype plugin indent on

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line}}
" let Vundle manage Vundle, required

let g:ycm_filetype_blacklist = { 'text':1, 'tex':1 }
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

if has("autocmd")
    augroup JumpCursorOnEdit
    autocmd!
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
    augroup END
endif

au BufRead,BufNewFile *.smv    setfiletype smv
au BufRead,BufNewFile *.vam    setfiletype vam
au BufRead,BufNewFile *.fst    setfiletype fast
au BufRead,BufNewFile *.armc    setfiletype armc
au BufRead,BufNewFile *.isac    setfiletype isac
au BufRead,BufNewFile *.codal    setfiletype codal
au BufRead,BufNewFile *.t2t    setfiletype txt2tags
au BufRead,BufNewFile *.smt    setfiletype smt-lib
au BufRead,BufNewFile *.smt2    setfiletype smt-lib

" Insert header into bash script, C and C++ files
autocmd bufnewfile *.c,*.cpp so ~/.vim/templates/c_header.txt
autocmd bufnewfile *.h,*.hpp so ~/.vim/templates/h_header.txt
autocmd bufnewfile *.sh so ~/.vim/templates/sh_header.txt
autocmd bufnewfile *.c,*.h,*.hpp,*.cpp,*.sh exe "1," . 12 . "g/filename/s//".expand("%:t")
autocmd bufnewfile *.c,*.h,*.hpp,*.cpp,*.sh exe "1," . 12 . "g/Created:.*/s/Created:.*/Created:\t" .strftime("%d.%m.%Y %H:%M")
autocmd bufnewfile *.sh exe "1," . 10 . "g/SHELL:.*/s//SHELL:\t\t".system('$SHELL --version 2>&1 | head -n 1')|$
autocmd bufnewfile *.c,*.h exe "1," . 12 . "g/gcc:.*/s//gcc:\t\t".system('gcc -v 2>&1 | grep "version [0-9]"')|$
autocmd bufnewfile *.hpp,*.cpp exe "1," . 12 . "g/gcc:.*/s//g++:\t\t".system('g++ -v 2>&1 | grep "version [0-9]"')|$
autocmd bufnewfile *.h,*.hpp exe "13," . 18 . "g/_FILE_H_/s/FILE/".toupper(expand("%:t:r"))|16
"autocmd Bufwritepre,filewritepre *.c,*.h,,*.hpp,*.cpp,*.sh execute "normal ma"
"autocmd Bufwritepre,filewritepre *.c,*.h,*.hpp,*.cpp,*.sh exe "1," . 12 . "g/Edited:.*/s/Edited:.*/Edited:\t\t" .strftime("%d.%m.%Y %H:%M")
"autocmd bufwritepost,filewritepost *.c,*.h,*.hpp,*.cpp,*.sh execute "normal `a"

" mouse support
"set mouse=a

" include ./.vimrc file (securely)
set exrc
set secure

syntax enable       " Only define colors for groups that don't have highlighting yet.
" syntax on         " Highlight colors are overruled but links are kept
"
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256
"colorscheme random
set number
set numberwidth=2
"set synax=c
set nocompatible
set ruler
set showcmd
set wildmenu
set fileencodings=utf-8,latin2,ISO8859-2,WINDOWS-1250
set showmatch
set incsearch
set hlsearch

" backspace nech sa chova ako backspace
set backspace=indent,eol,start
" automaticke pokracovanie v komentaroch
set formatoptions+=r

" C style programming:
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
"setlocal noexpandtab
setlocal smarttab
setlocal smartindent
setlocal tw=79
setlocal tabpagemax=100
    
" save
map <F2> <ESC>:w<CR>
imap <F2> <ESC>:w<CR>a

" switch between paste and nopaste
set pastetoggle=<F4>
" no highlight
map <F5> <ESC>:noh<CR>
imap <F5> <ESC>:noh<CR>a
" wrap current paragraph
map <F6> <ESC>gq}
map <C-F6> )i<CR>%<CR><ESC>
imap <F6> <ESC>gq}k$a
" settings with various tabstop and tabwidth (in command or insert mode)
" tab=8
map <F7> <ESC>:set ts=8<CR>:set noexpandtab<CR>:set sw=8<CR>
imap <F7> <ESC>:set ts=8<CR>:set noexpandtab<CR>:set sw=8<CR>a
" tab=4, only spaces
map <F8> <ESC>:set incsearch<CR>:set ts=4<CR>:set expandtab<CR>:set sw=4<CR>
imap <F8> <ESC>:set incsearch<CR>:set ts=4<CR>:set expandtab<CR>:set sw=4<CR>a
" save and make
map <F9> <ESC>:w<CR>:make<CR>
imap <F9> <ESC>:w<CR>:make<CR>

imap <C-d> <C-o>diw

"" insert date stamp for changelog
"map <F10> <ESC>k:r! LC_ALL=en_US date "+* \%a \%b \%d \%Y Jozef Zuzelka"<CR>o
"imap <F10> <ESC>k:r! LC_ALL=en_US date "+* \%a \%b \%d \%Y Jozef Zuzelka"<CR>o<TAB>

"" insert school projects header
" http://www.thegeekstuff.com/2008/12/vi-and-vim-autocommand-3-steps-to-add-custom-header-to-your-file/
" ak nevklada uvodne hviezdicky odkomentujte nasledujuci riadok
" set formatoptions+=r
map <F10> <ESC>ggO/* <ESC>:let @a=expand("%:t")<LF>"apo<TAB>Name:<TAB><TAB>1.project IPK, FIT VUT Brno<LF>Author:<TAB><TAB>Jozef Zuzelka, xzuzel00<LF>Mail:<TAB><TAB>xzuzel00@stud.fit.vutbr.cz<LF><ESC>k:r! date "+ *<TAB>Date:<TAB><TAB>\%d.\%m.\%Y"<CR>oVersion:<TAB>1.0.0<LF>g++:<TAB><TAB><ESC>:let @a=system('g++ -v 2>&1 \| grep "version [0-9]"')<CR>h"apkJo/<ESC>j^hdwdwko<CR><ESC>G
imap <F10> <ESC>gg:r! date "+* \%a \%b \%d \%Y Jozef Zuzelka"<CR>

" taglist
map <M-Right> :YcmCompleter GoToDefinition<CR>
map <M-Up> :YcmCompleter GoToDeclaration<CR>
map <M-Left> <C-O>
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-\> :tab split<CR>:YcmCompleter GoToDeclaration<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"set path=.


" VHDL indent file
" from: http://www.vim.org/scripts/script.php?script_id=1450
filetype indent on

":highlight Normal ctermfg=grey ctermfg=black
":set background=light


"------------- SYNTASTIC configuration ----------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0 
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_cpp_check_header = 1
" let g:syntastic_cpp_no_include_search = 0
" let g:syntastic_javascript_checkers = ["eslint"]
" let g:syntastic_coffeescript_checkers = ["coffeelint"]
" let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = " -std=c++14 -pedantic -Wall"
" let g:syntastic_java_checkers = []
let g:syntastic_error_symbol = "X"
let g:syntastic_style_error_symbol = ">"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_warning_symbol = ">"
let g:syntastic_loc_list_height = 5
let g:syntastic_python_python_exec = '/Library/Frameworks/Python.framework/Versions/3.5/bin/python3'

" rychlejsi prechod do command mode (cakava sa kvoli skratkam -na dalsie klavesy)
" set ttimeout
" set ttimeoutlen=50

" This enables visual wrapping
set wrap

" This turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0
set wrapmargin=0

augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', 'todo', -1)
augroup END

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 sts=4

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" http://vim.wikia.com/wiki/Alternative_tab_navigation
" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" enables to search in all open buffers with :Search <pattern>
command! -nargs=1 Search call setqflist([]) | silent bufdo grepadd! <args> %

"nnoremap <left>  :cprev<cr>zvzz
"nnoremap <right> :cnext<cr>zvzz

colo 256-jungle


"   *** CREDITS ***
" Ing. Ales Smrcka PhD. <www.fit.vutbr.cz/~smrcka>
" Jozef Zuzelka <>
