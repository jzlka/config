" TODO nech pri ulozeni c,h suborov vzdy skontroluje na todo a hodi do
" hlavicky vsetky
" todo :12 nema byt pre win_shell opacne lomitko?
set autoindent
set nocompatible
" More on YouCompleteMe:
" https://github.com/Valloric/YouCompleteMe/blob/master/README.md


" Load Vundle and other bundles
source ~/.vim/config/bundles.vim

" Set YouCompleteMe plugin
if filereadable(glob("~/.vim/config/youcompleteme.vim"))
    source ~/.vim/config/youcompleteme.vim
endif

" Set syntastic plugin
if filereadable(glob("~/.vim/config/syntastic.vim"))
    source ~/.vim/config/syntastic.vim
endif

" Set Airline plugin
if filereadable(glob("~/.vim/config/airline.vim"))
    source ~/.vim/config/airline.vim
endif

" Load functions
if filereadable(glob("~/.vim/config/functions.vim"))
    source ~/.vim/config/functions.vim
endif

" Set filetypes
if filereadable(glob("~/.vim/config/filetypes.vim"))
    source ~/.vim/config/filetypes.vim
endif

" Set mappings
if filereadable(glob("~/.vim/config/mappings.vim"))
    source ~/.vim/config/mappings.vim
endif

" Set highlight
if filereadable(glob("~/.vim/config/highlight.vim"))
    source ~/.vim/config/highlight.vim
endif


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



" mouse support
"set mouse=a


" include ./.vimrc file (securely)
set exrc
set secure

syntax enable       " Only define colors for groups that don't have highlighting yet.
" syntax on         " Highlight colors are overruled but links are kept

" Autoload Doxygen highlighting
"let g:load_doxygen_syntax=1

if has('gui_running')
    set background=light
else
    set background=dark
"    let g:solarized_termcolors=256
endif
"colorscheme solarized
colo 256-jungle
"colo badwolf
"colo darcula
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
set incsearch                                               " show the first match for the pattern, while typing
set hlsearch                                                " highlight all matches for the pattern

" backspace nech sa chova ako backspace
set backspace=indent,eol,start
" automaticke pokracovanie v komentaroch
set formatoptions+=r

" C style programming:
set tabstop=4
set shiftwidth=4
set expandtab
"setlocal noexpandtab
set smarttab
set smartindent
set tw=79
set tabpagemax=100

" Set height of the preview window (because of YCM)
set previewheight=20


"set path=.




":highlight Normal ctermfg=grey ctermfg=black
":set background=light




" rychlejsi prechod do command mode (cakava sa kvoli skratkam -na dalsie klavesy)
" set ttimeout
" set ttimeoutlen=50

" This enables visual wrapping
set wrap

" This turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0
set wrapmargin=0

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif




augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', 'todo', -1)
augroup END



" enables to search in all open buffers with :Search <pattern>
command! -nargs=1 Search call setqflist([]) | silent bufdo grepadd! <args> %

"nnoremap <left>  :cprev<cr>zvzz
"nnoremap <right> :cnext<cr>zvzz



" Highlight text longer than 80 chars
"highlight OverLength ctermbg=red ctermfg=white guibg=#FFD9D9
"match OverLength /\%81v.\+/





" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl"
                \ ]
"let g:secure_modelines_verbose=1
"set modeline
"set modelines=5

" Activate Rainbow Parentheses
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle





"   *** CREDITS ***
" Ing. Ales Smrcka PhD. <www.fit.vutbr.cz/~smrcka>
" Jozef Zuzelka <>
