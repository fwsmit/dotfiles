set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" turn off annoying beep
set visualbell

let g:useAllPlugins = 1
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

if useAllPlugins 
	" easy insert mode escape
	Plugin 'zhou13/vim-easyescape'
	
	" file tree explorer
	Plugin 'scrooloose/nerdtree'

	" nerd commenter
	Plugin 'scrooloose/nerdcommenter'

	" color schemes:
	" material-monokai
	Plugin 'skielbasa/vim-material-monokai'

	" fuzzy finder
	Bundle 'L9'
	Bundle 'FuzzyFinder'

	" latex
	"Plugin 'ying17zi/vim-live-latex-preview'

	" vim-airline
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'

	" youcomplete me code completion
	Plugin 'valloric/youcompleteme'

	" surround vim
	Plugin 'tpope/vim-surround'
endif
"
" LucHerimitte stuff
"  - Header/source switching
"  - Brackets
Plugin 'LucHermitte/lh-vim-lib'
Plugin 'LucHermitte/lh-style'
Plugin 'LucHermitte/lh-tags'
Plugin 'LucHermitte/lh-dev'
Plugin 'LucHermitte/lh-brackets'
Plugin 'LucHermitte/searchInRuntime'
"Plugin 'LucHermitte/mu-template'
Plugin 'tomtom/stakeholders_vim'
Plugin 'LucHermitte/alternate-lite'
"Plugin 'LucHermitte/lh-cpp'

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
set relativenumber

"turn on syntax highlighting
syntax on

if useAllPlugins 
	" NERDTree config
	" Give a shortcut key to NERD Tree
	map <F2> :NERDTreeToggle<CR>

	" fuzzy finder mappings
	" open fuzzy file
	nmap \t :FufFile<CR>
	" open fuzzy buffer
	"nmap \b :FufBuffer<CR>
	" open fuzzy coverage file (search file recursively)
	nmap \f :FufCoverageFile<CR>

	" header/source switching (alternate)
	" map \a :call CurtineIncSw()<CR>
	nmap \a :AS<CR>
	call lh#alternate#register_extension('g', 'cpp', ['h'], 1)
	call lh#alternate#register_extension('g', 'h', ['cpp'], 1)
	let g:usemarks = 0
endif


" colorschemes
"set background=dark
"set termguicolors
"colorscheme material-monokai

" make comments italic
"let g:materialmonokai_italic=1 " this doesn't seem to work
highlight Comment cterm=italic


" vim-airline
"let g:airline_symbols.maxlinenr = 'L'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.readonly = 'READ ONLY'
"let g:airline_powerline_fonts = 1 " activate powerline symbols

set encoding=utf-8
"set guifont=Liberation\ Mono\ for\ Powerline\ 100
"set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10


"Searching
set ignorecase
set smartcase
set incsearch

" exit and save shortcuts
nmap \x :conf qa<CR>
nmap \s :wa<CR>
nmap \q :conf q<CR>

" fuzzyfinder config
"let g:fufcoveragefile_exclude = 'build/.*'  " doesnt work
let g:fufcoveragefile_exclude = '*.cpp'  " doesnt work
"
" youcompletme config
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_server_python_interpreter = "/bin/python2"
let g:ycm_filetype_whitelist = { 'cpp': 1 }
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap \e :YcmCompleter FixIt<CR>
inoremap \e <C-O>:YcmCompleter FixIt<CR>

" Don't insert a template
let g:mt_IDontWantTemplatesAutomaticallyInserted = 1

" Mappings to go to insert mode
"imap jk <Esc>l
"imap kj <Esc>l

"inoremap <Esc> jk:echo "Don't use escape"

let g:easyescape_timeout = 300

" Mappings to move trough camelCase words
nnoremap ,w /\u<CR>
nnoremap ,b ?\u<CR>
