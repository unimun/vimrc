let s:darwin = has('mac')
let s:windows = has('win32') || has('win64')

call plug#begin('~/.vim/plugged')

" Appearance
Plug 'junegunn/seoul256.vim'
Plug 'itchyny/lightline.vim'

" Edit
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'

" Browsing
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'

" Lang
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'mzlogin/vim-markdown-toc'
if v:version >= 800 && !s:windows
  Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
endif
Plug 'm-pilia/vim-ccls'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
Plug 'github/copilot.vim'


" Sessions
Plug 'unimun/heytmux'
Plug 'tpope/vim-obsession'

" Include custom plugins
try
    source ~/.vim/my_plugins.vim
catch
endtry

call plug#end()

