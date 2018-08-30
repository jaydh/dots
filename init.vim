call plug#begin()
	Plug 'crusoexia/vim-monokai'
	Plug 'kristijanhusak/vim-hybrid-material'
  Plug 'dylanaraps/wal'
	Plug 'rakr/vim-one'
	Plug 'elzr/vim-json'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'Quramy/tsuquyomi'
  Plug 'scrooloose/nerdtree'
	Plug 'severin-lemaignan/vim-minimap'
	Plug 'bling/vim-airline'
	Plug 'prettier/vim-prettier', {'do': 'yarn install'}
	Plug 'jiangmiao/auto-pairs'
	Plug 'Shougo/deoplete.nvim'
  Plug 'lilydjwg/colorizer'
  Plug 'mhartington/vim-typings'
  Plug 'junegunn/limelight.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'challenger-deep-theme/vim'
  Plug 'tpope/vim-surround'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'w0rp/ale'
call plug#end()

command W w !sudo tee "%" > /dev/null
let g:ale_fixers = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
map <Leader>o :ALEFix<CR>
syntax enable
colorscheme palenight
set background=dark
set number relativenumber
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

set modelines=0
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
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile
set number

nnoremap / /\v
vnoremap / /\vset ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %v
noremap <tab> %
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

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
inoremap <F1> <ESC>nnoremap <F1> <ESC>vnoremap <F1> <ESC>
nnoremap <NL> i<CR><ESC>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
