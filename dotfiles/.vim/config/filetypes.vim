autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 sts=4
" Associate .mm files as Objective-C++
autocmd BufRead,BufNewFile *.mm setl filetype=objcpp

au BufRead,BufNewFile *.smv     setfiletype smv
au BufRead,BufNewFile *.vam     setfiletype vam
au BufRead,BufNewFile *.fst     setfiletype fast
au BufRead,BufNewFile *.armc    setfiletype armc
au BufRead,BufNewFile *.isac    setfiletype isac
au BufRead,BufNewFile *.codal   setfiletype codal
au BufRead,BufNewFile *.t2t     setfiletype txt2tags
au BufRead,BufNewFile *.smt     setfiletype smt-lib
au BufRead,BufNewFile *.smt2    setfiletype smt-lib
au BufRead,BufNewFile *.tpp     set filetype=cpp


"autocmd FileType sh,perl,python  :call <SID>StripTrailingWhitespaces()
"autocmd BufWritePre * if &ft =~ 'sh\|perl\|python' | :call <SID>StripTrailingWhitespaces() | endif



let customHeader_supportedExts = "*.{c, cpp, cs, h, hpp, tpp, sh, py, m, mm, txt}"

" Insert header into bash script, C/C++/C#/sh files
autocmd bufnewfile *.{c,cpp,cs,mm} so ~/.vim/templates/c_header.txt
autocmd bufnewfile *.h so ~/.vim/templates/h_header.txt
autocmd bufnewfile *.{hpp,tpp} so ~/.vim/templates/hpp_header.txt
autocmd bufnewfile *.{sh} so ~/.vim/templates/sh_header.txt
autocmd bufnewfile *.py so ~/.vim/templates/py_header.txt
autocmd bufnewfile *.m so ~/.vim/templates/matlab_header.txt
autocmd bufnewfile Makefile so ~/.vim/templates/makefile_basic.txt
autocmd bufnewfile *.txt so ~/.vim/templates/txt_header.txt


autocmd bufnewfile *.{c,cpp,cs,h,hpp,tpp,sh,py,m,mm,txt},Makefile exe "1,".2."s/filename/".expand("%:t")
autocmd bufnewfile *.{c,cpp,cs,h,hpp,tpp,sh,py,m,mm,txt},Makefile exe "5,".6."s/\\(Created:\\)/\\1 ".strftime("%d.%m.%Y %H:%M")

autocmd bufnewfile *.{c,h} exe 9."s/\\(gcc:\\)/\\1 ".system('gcc -v 2>&1 | grep "version [0-9]"')[:-2]|$
autocmd bufnewfile *.{c,h,t}pp exe 9."s/gcc:/g++: ".system('g++ -v 2>&1 | grep "version [0-9]"')[:-2]|$
autocmd bufnewfile *.h exe "13," . 18 . "g/_FILE_H_/s/FILE/".toupper(expand("%:t:r"))|16
autocmd bufnewfile *.cs exe 9."s/gcc:/mono: ".system('mcs --version 2>&1')[:-2]|$
autocmd bufnewfile *.{sh} exe 9."s/\\(SHELL:\\)/\\1 ".system('$SHELL --version 2>&1 | head -n 1')[:-2]|$
autocmd bufnewfile *.py exe 9."s/\\(Python:\\)/\\1 ".system('python --version 2>&1 | head -n 1')[:-2]|$
autocmd bufnewfile Makefile exe 8."s/\\(make:\\)/\\1 ".system('make --version 2>&1 | head -n1')[:-2]|$
autocmd bufnewfile *.txt exe 8."s/\\(VIM:\\)/\\1 ".system('vim --version 2>&1 | head -n1')[:-2]|$

let updateCustomHeader = 0

if (updateCustomHeader == 1)
    autocmd Bufwritepre,filewritepre *.{c,cpp,cs,h,hpp,tpp,sh,py,m,mm,txt},Makefile execute "normal ma"
    autocmd Bufwritepre,filewritepre *.{c,cpp,cs,h,hpp,tpp,sh,py,m,mm,txt},Makefile exe "1,".2."s/^\\(\\( \\*\\|#\\) \\{1,3\\}@file \\{7,8\\}\\).*/\\1".expand("%:t")
    autocmd Bufwritepre,filewritepre *.{c,cpp,cs,h,hpp,tpp,sh,py,m,mm,txt},Makefile exe "1,".10."s/^\\(\\( \\*\\|#\\) \\{1,4\\}- Edited:\\).*/\\1  ".strftime("%d.%m.%Y %H:%M")
    autocmd bufwritepost,filewritepost *.{c,cpp,cs,h,hpp,tpp,sh,py,m,mm,txt},Makefile execute "normal `a"
endif
"autocmd bufwritepost,filewritepost *.c,*.h,*.hpp,*.cpp,*.cs exe "let @s="system('grep "^.*[^@]todo.*" '.expand('%'))
"autocmd bufwritepost,filewritepost *.c,*.h,*.hpp,*.cpp,*.cs exe "10"
"autocmd bufwritepost,filewritepost *.c,*.h,*.hpp,*.cpp,*.cs exe '"sp'
"autocmd bufwritepre *.{c,cpp,cs,h,hpp,tpp} retab



" VHDL indent file
" from: http://www.vim.org/scripts/script.php?script_id=1450
filetype indent on

