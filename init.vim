echo '(-.-)'
"---Plug-in manager---
call plug#begin()
"Themes
Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'ajmwagar/vim-deus'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'yuezk/vim-js'
Plug 'wesQ3/vim-windowswap'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', {'do': { -> fzf#install() } } "fuzzy finder for files
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep' "fast searching
Plug 'ap/vim-css-color' "show color when writing hex colors/rgb
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete for many languages
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml'] } "js/ts/css/json/markdown... formatting

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
call plug#end()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript", "typescript", "tsx", "html", "python",
    "bash", "ql", "rust", "cpp", "json", "jsonc", "vue", "yaml",
    "css"
  },
  highlight = {
    enable = true
  },
}
EOF

"---Settings:
set relativenumber
set number

"Leader:
let mapleader = ","

"Normal Commands:
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>vv :source $MYVIMRC<CR>

autocmd FileType python noremap <buffer> <C-b> :!python %<CR>
"-Plugin Commands:
"--WindowSwap Commands:
nnoremap <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <leader>ww :call WindowSwap#EasyWindowSwap()<CR>
"scrooloose/nerdtree--NerdTree Commands:
nnoremap <leader>k :NERDTreeToggle<CR>
"--fzf:
noremap <C-p> :FZF<CR>
"--ripgrep
nnoremap <leader>f :PRg!<CR>
nnoremap <C-f> :Rg 

"-Esc Insert
inoremap jk <esc>

"-Switch Splits:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"------ COC ------
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<CR>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<CR>
nnoremap <silent> <space>d :CocDiagnostics<CR>
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
autocmd FileType typescriptreact,typescript,javascript,rust,cpp,c xmap <buffer> if <Plug>(coc-funcobj-i)
autocmd FileType typescriptreact,typescript,javascript,rust,cpp,c omap <buffer> if <Plug>(coc-funcobj-i)
autocmd FileType typescriptreact,typescript,javascript,rust,cpp,c xmap <buffer> af <Plug>(coc-funcobj-a)
autocmd FileType typescriptreact,typescript,javascript,rust,cpp,c omap <buffer> af <Plug>(coc-funcobj-a)
autocmd FileType typescriptreact,typescript,javascript,rust,cpp,c xmap <buffer> ic <Plug>(coc-classobj-i)
autocmd FileType typescriptreact,typescript,javascript,rust,cpp,c omap <buffer> ic <Plug>(coc-classobj-i)
autocmd FileType typescriptreact,typescript,javascript,rust,cpp,c xmap <buffer> ac <Plug>(coc-classobj-a)
autocmd FileType typescriptreact,typescript,javascript,rust,cpp,c omap <buffer> ac <Plug>(coc-classobj-a)

nnoremap <silent> <leader>tt :CocCommand terminal.Toggle<CR>
"------ END COC ------

"Startup:
"-Enable NerdTree
autocmd VimEnter * NERDTree 

let $FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs --glob "!{**/migrations/**.py,**/__pycache__/**,node_modules/*,*/node_modules/*,target/*,**/target/**,.git/*,**/*.pyc,**/tests/**}"'

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" press tab to iterate through autocomplete options
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

command! -bang -nargs=* PRg
\ call fzf#vim#grep('rg --column --no-heading --line-number --color=always '.shellescape(<q-args>),
\                 '-S',
\                 <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'})
\                         : fzf#vim#with_preview('right:50%:hidden', '?'),
\                 <bang>0)
"Rg customization end

set clipboard=unnamed
set showcmd

if has('termguicolors')
    set termguicolors
endif

" COLORSCHEME
set background=dark
colorscheme hybrid_reverse

