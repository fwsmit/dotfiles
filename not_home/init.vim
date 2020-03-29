" root neovim config
set nocompatible              " be iMproved, required
filetype off                  " required

" Basic configuration
set tabstop=4
set shiftwidth=4
set smartindent
"turn on line numbers
set number
set relativenumber

set background=dark
syntax enable
set termguicolors

set encoding=utf-8

"Searching
set ignorecase
set smartcase
set incsearch
set nohlsearch

" exit and save shortcuts
nmap \x :conf qa<CR>
nmap \s :wa<CR>
nmap \q :conf q<CR>




" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" easy insert mode escape
Plugin 'zhou13/vim-easyescape'

" nerd commenter
Plugin 'scrooloose/nerdcommenter'

" color schemes:
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme gruvbox

let g:easyescape_timeout = 300

" insert new line without going to insert mode
noremap <Bar> O<Esc>
noremap <CR> o<Esc>
