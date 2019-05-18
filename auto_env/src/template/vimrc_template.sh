#!/bin/bash
# Author: CloudS3n

cat << EOF
" indent options
set autoindent
set expandtab
filetype plugin indent on
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4

" search options
set hlsearch
set ignorecase
set incsearch
set smartcase

" performance options
set complete-=5
set lazyredraw

" text rendering options
set display+=lastline
set encoding=utf-8
set linebreak
syntax on
set wrap

" interface options
set number
set nocompatible
set t_Co=256
set background=dark
EOF