execute pathogen#infect()

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Initialize plugin system
call plug#end()
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

set nocompatible
syntax on
filetype plugin on
filetype indent on
:let g:html_indent_inctags = "html,body,head,tbody" 

let vimrplugin_assign = 0

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
runtime macros/matchit.vim
vmap <Tab> >gv
vmap <S-Tab> <gv

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'output',
    \}
set conceallevel=1
let g:tex_conceal='abdmg'

autocmd BufEnter *.mp :setlocal filetype=javascript
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

" enable use of y to copy text (in normal mode)
set clipboard=unnamedplus

" set printer
:set pdev=Office1

" indent whole file
nmap <F3> gg=G

" merge all multiple empty lines
nmap <F2> :call Mergelines() 
function! Mergelines()
        :%s/\s\+$//e
        :%s/\n\{3,}/\r\r/e
endfunction

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
