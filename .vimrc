call pathogen#infect()

syntax on
set nu
set hlsearch
set tabstop=2
set expandtab
filetype on
au BufNewFile,BufRead *.ru,Gemfile* set filetype=ruby
