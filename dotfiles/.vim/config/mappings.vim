" taglist
map <M-Right> :YcmCompleter GoToDefinition<CR>
map <M-Up> :YcmCompleter GoToDeclaration<CR>
map <M-Left> <C-O>
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-\> :tab split<CR>:YcmCompleter GoToDeclaration<CR>



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



" http://vim.wikia.com/wiki/Alternative_tab_navigation
" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>



inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}



"" insert date stamp for changelog
"map <F10> <ESC>k:r! LC_ALL=en_US date "+* \%a \%b \%d \%Y Jozef Zuzelka"<CR>o
"imap <F10> <ESC>k:r! LC_ALL=en_US date "+* \%a \%b \%d \%Y Jozef Zuzelka"<CR>o<TAB>

"" insert school projects header
" http://www.thegeekstuff.com/2008/12/vi-and-vim-autocommand-3-steps-to-add-custom-header-to-your-file/
" ak nevklada uvodne hviezdicky odkomentujte nasledujuci riadok
" set formatoptions+=r
map <F10> <ESC>ggO/* <ESC>:let @a=expand("%:t")<LF>"apo<TAB>Name:<TAB><TAB>1.project IPK, FIT VUT Brno<LF>Author:<TAB><TAB>Jozef Zuzelka, xzuzel00<LF>Mail:<TAB><TAB>xzuzel00@stud.fit.vutbr.cz<LF><ESC>k:r! date "+ *<TAB>Date:<TAB><TAB>\%d.\%m.\%Y"<CR>oVersion:<TAB>1.0.0<LF>g++:<TAB><TAB><ESC>:let @a=system('g++ -v 2>&1 \| grep "version [0-9]"')<CR>h"apkJo/<ESC>j^hdwdwko<CR><ESC>G
imap <F10> <ESC>gg:r! date "+* \%a \%b \%d \%Y Jozef Zuzelka"<CR>



" Ask before updating header
"cnoremap <silent> wn<CR>  :call DisableUpdate(1)<CR>
"cnoremap <silent> w<CR>   :call DisableUpdate(0)<CR>



" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif


" In case I fat-finger W/Wq.
command! W write
command! Wq wq

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Map w!! to sudo save
"command! SudoWrite set noro | w !sudo tee % >/dev/null
"cmap w!! SudoWrite<CR><CR>


" Mappings for Mac pbcopy
if has("osx")
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

