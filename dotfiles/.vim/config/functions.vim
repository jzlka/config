" Ask before updating header
function! DisableUpdate(disable)
    if (a:disable)
        if (expand('%:t')=="")
            echo "Can't save a file with no name."
            return
        endif
        let updateCustomHeader = 0
        :write
    else
        let updateCustomHeader = 1
        :write
    endif
endfu


function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


" Ask before quiting
function! ConfirmQuit(writeFile)
    if (a:writeFile)
        if (expand('%:t')=="")
            echo "Can't save a file with no name."
            return
        endif
        :write
    endif

    if (winnr('$')==1 && tabpagenr('$')==1)
        if (confirm("Do you really want to quit?", "&Yes\n&No", 2)==1)
            :quit
        endif
    else
        :quit
    endif
endfu
"cnoremap <silent> q<CR>  :call ConfirmQuit(0)<CR>
"cnoremap <silent> x<CR>  :call ConfirmQuit(1)<CR>
"autocmd bufenter c:/intranet/notes.txt cnoremap <silent> wq<cr> call ConfirmQuit(1)<cr>


" Find callers of the function name currently under the cursor (:Csc<enter>)
function! Csc()
    cscope find c <cword>
    copen
endfunction
command! Csc call Csc()
