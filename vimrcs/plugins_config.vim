"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    colorscheme seoul256
catch
endtry

set background=dark

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)
" Sort \\ as well
let g:easy_align_delimiters = {
  \ '\': {
  \     'pattern': '\\$',
  \ },
  \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $FZF_DEFAULT_OPTS .= ' --inline-info'

command! -nargs=? -complete=dir AF
  \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
  \   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
  \ })))

" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>L        :Lines<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos     = "right"
let NERDTreeShowHidden   = 0
let NERDTreeIgnore       = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize    = 35
let g:NERDTreeQuitOnOpen = 1
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>cb :TagbarToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>fb :Gblame<cr>
nnoremap <leader>fs :Gstatus<cr>
nnoremap <leader>fw :Git show<cr>
nnoremap <leader>fl :Git log --decorate=short<cr>
nnoremap <leader>ff :Git log --decorate=short -p %<cr>
nnoremap <leader>f1 :Git log --oneline<cr>
nnoremap <leader>fca :Git cherry-pick --abort<cr>
nnoremap <leader>fcc :Git cherry-pick --continue<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-signify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:signify_vcs_list          = ['git']
let g:signify_skip_filetype     = { 'journal': 1 }
let g:signify_sign_add          = '│'
let g:signify_sign_change       = '│'
let g:signify_sign_changedelete = '│'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap gd <Plug>(coc-definition)
nmap gD <Plug>(coc-declaration)
nmap gr <Plug>(coc-references)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap <leader>rn <Plug>(coc-rename)
nnoremap gh :<C-U>call CocActionAsync('doHover')<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-ccls
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap gs :<C-U>CclsCallHierarchy<cr>
nnoremap gS :<C-U>CclsCalleeHierarchy<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-mark
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mw_no_mappings = 1
if !hasmapto('<Plug>MarkSet', 'n')
	nmap <unique> <Leader>mm <Plug>MarkSet
endif
if !hasmapto('<Plug>MarkSet', 'x')
	xmap <unique> <Leader>mm <Plug>MarkSet
endif
" No default mapping for <Plug>MarkIWhiteSet.
if !hasmapto('<Plug>MarkRegex', 'n')
	nmap <unique> <Leader>mr <Plug>MarkRegex
endif
if !hasmapto('<Plug>MarkRegex', 'x')
	xmap <unique> <Leader>mr <Plug>MarkRegex
endif
if !hasmapto('<Plug>MarkClear', 'n')
	nmap <unique> <Leader>mn <Plug>MarkClear
endif

