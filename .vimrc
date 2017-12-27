set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" turn off annoying beep
set visualbell

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" file tree explorer
Plugin 'scrooloose/nerdtree'

" nerd commenter
Plugin 'scrooloose/nerdcommenter'

" Header/source switching
"Plugin 'ericcurtin/CurtineIncSw.vim'
Bundle 'LucHermitte/lh-vim-lib'
Plugin 'LucHermitte/alternate-lite'

" color schemes:
" material-monokai
Plugin 'skielbasa/vim-material-monokai'

" fuzzy finder
Bundle 'L9'
Bundle 'FuzzyFinder'

" latex
Plugin 'ying17zi/vim-live-latex-preview'

" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"turn on automatic indentation
set tabstop=4
set shiftwidth=4
set smartindent
"turn on line numbers
set number

"turn on syntax highlighting
syntax on

" NERDTree config
" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

" fuzzy finder mappings
" open fuzzy file
nmap \t :FufFile<CR>
" open fuzzy buffer
nmap \b :FufBuffer<CR>
" open fuzzy coverage file (search file recursively)
nmap \f :FufCoverageFile<CR>

" header/source switching
" map \a :call CurtineIncSw()<CR>
nmap \a :AS<CR>



" colorschemes
set background=dark
"set termguicolors
"colorscheme material-monokai

" make comments italic
"let g:materialmonokai_italic=1 " this doesn't seem to work
highlight Comment cterm=italic


" vim-airline
let g:airline_powerline_fonts = 1 " activate powerline symbols

set encoding=utf-8
"set guifont=Liberation\ Mono\ for\ Powerline\ 100
"set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10

"if !exists('g:airline_symbols')
	"let g:airline_symbols = {}
"endif

  "" unicode symbols
  "let g:airline_left_sep = '»'
  "let g:airline_left_sep = '▶'
  "let g:airline_right_sep = '«'
  "let g:airline_right_sep = '◀'
  "let g:airline_symbols.linenr = '␊'
  "let g:airline_symbols.linenr = '␤'
  "let g:airline_symbols.linenr = '¶'
  "let g:airline_symbols.branch = '⎇'
  "let g:airline_symbols.paste = 'ρ'
  "let g:airline_symbols.paste = 'Þ'
  "let g:airline_symbols.paste = '∥'
  "let g:airline_symbols.whitespace = 'Ξ'

  "" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
"
"let g:airline_symbols_ascii = 1
"
"
"Searching
set ignorecase
set smartcase
set incsearch
