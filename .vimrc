set nocompatible
syntax enable
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
