set clipboard=unnamed
set tabstop=8     " tabs are at proper location
set expandtab     " don't use actual tab character (ctrl-v)
set shiftwidth=4  " indenting is 4 spaces
set autoindent    " turns it on
set smartindent   " does the right thing (mostly) in programs
set cindent       " stricter rules for C programs
set number
set visualbell
imap ;; <Esc>     "sequence ;; becomes escape"

call plug#begin('~/.vim/plugged')
" tabular plugin is used to format tables
Plug 'godlygeek/tabular'
" JSON front matter highlight plugin
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
call plug#end()

" markdown
let g:vim_markdown_folding_disabled = 1

