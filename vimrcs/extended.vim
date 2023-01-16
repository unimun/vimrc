"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vim/my_configs.vim<cr>
autocmd! bufwritepost ~/.vim/my_configs.vim source ~/.vim/my_configs.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim/temp_dirs/undodir
    set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Mode escape
tnoremap kj <C-\><C-n>
inoremap kj <C-\><C-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab xday  <c-r>=strftime("%d/%m/%y")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap cp :let @" = expand("%:p")<cr>

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

function! RunCmdAsync()
    let cmd_str = getline(".")
    let nr = bufadd('')
    if has('nvim')
        exe "below sbuffer" .nr
        exe ":terminal ".cmd_str
    else
        let job = job_start(cmd_str, {'out_io': 'buffer', 'out_buf': nr, 'err_io': 'buffer', 'err_buf': nr})
        exe "below sbuffer".nr
    endif
endfunction

function! RunRegAsync()
    let cmd_str = getreg("b")
    let nr = bufadd('')
    if has('nvim')
        exe "below sbuffer" .nr
        exe ":terminal ".cmd_str
    else
        let job = job_start(cmd_str, {'out_io': 'buffer', 'out_buf': nr, 'err_io': 'buffer', 'err_buf': nr})
        exe "below sbuffer".nr
    endif
endfunction

nnoremap <Leader>rr :call RunCmdAsync()<cr>
nnoremap <Leader>rb :call RunRegAsync()<cr>
nnoremap <Leader>rt :let $VIM_DIR=expand('%:p:h')<CR>:below sp<CR>:terminal<CR>acd $VIM_DIR<CR>

" Debugger mode(need to be in local)
nnoremap <F5> :Step<cr>
nnoremap <F6> :Over<cr>
nnoremap <F7> :Finish<cr>
