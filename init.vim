echo '---'
set relativenumber
set number
let mapleader = ","
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>vv :source $MYVIMRC<CR>
nnoremap <leader>k :NERDTreeToggle<CR>
nnoremap <leader>gp :!gop <bar> :q<CR>
inoremap jk <esc>

call plug#begin()
Plug 'scrooloose/nerdtree'


call plug#end()

autocmd VimEnter * NERDTree

