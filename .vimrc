set nocompatible
set hidden

filetype on

set number
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

syntax on
set t_Co=256

set ruler
set laststatus=2
set encoding=utf-8
set showcmd
set showmode

set mouse=r

nmap <C-p> :Files<cr>
imap <c-x><c-l> <plug>(fzf-complete-line)

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-i': 'split',
      \ 'ctrl-s': 'vsplit' }
let g:fzf_layout = { 'down': '~60%' }

call plug#begin('~/.vim/plugged')
Plug '907th/vim-auto-save'
call plug#end()

colorscheme twilight256

