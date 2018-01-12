call plug#begin()
	Plug 'crusoexia/vim-monokai'
	Plug 'kristijanhusak/vim-hybrid-material'
  Plug 'dylanaraps/wal'
	Plug 'rakr/vim-one'
	Plug 'elzr/vim-json'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'Quramy/tsuquyomi'
	Plug 'severin-lemaignan/vim-minimap'
	Plug 'scrooloose/nerdtree'
	Plug 'bling/vim-airline'
	Plug 'prettier/vim-prettier', {'do': 'yarn install'}
	Plug 'jiangmiao/auto-pairs'
	Plug 'Shougo/deoplete.nvim'
  Plug 'lilydjwg/colorizer'
  Plug 'mhartington/vim-typings'
  Plug 'junegunn/limelight.vim'
call plug#end()

syntax enable
colorscheme wal 
set background=dark
let g:enable_bold_font = 1
let g:enbale_italic_font = 1
let g:airline_theme='one'
map <C-n> :NERDTreeToggle<CR>
map <Leader>i <Plug>(Prettier)
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#parser = 'babylon'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#trailing_comma = 'none'
let g:nvim_typescript#type_info_on_hold = 1
let g:nvim_typescript#signature_complete = 1
let g:deoplete#enable_at_startup=1

set backupcopy=yes
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

au FocusLost * :wa
