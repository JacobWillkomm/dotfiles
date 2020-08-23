echo '---'
"---Plug-in manager---
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': {-> fzf#install()} } "fuzzy finder for files

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
"--fzf:
noremap <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'rg --files'

inoremap jk <esc>
"-Switch Splits:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Startup:
"-Enable NerdTree
autocmd VimEnter * NERDTree 

set clipboard=unnamed
