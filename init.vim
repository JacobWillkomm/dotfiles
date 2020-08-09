echo '---'
"---Plug-in manager---
call plug#begin()
Plug 'scrooloose/nerdtree'


call plug#end()

"---Settings:
set relativenumber
set number

"Leader:
let mapleader = ","

"Normal Commands:
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>vv :source $MYVIMRC<CR>
"-Plugin Commands:
"--NerdTree Commands:
nnoremap <leader>k :NERDTreeToggle<CR>
"Insert Commands:
inoremap jk <esc>

"Startup:
"-Enable NerdTree, place curser in other buffer
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | wincmd p | endif

