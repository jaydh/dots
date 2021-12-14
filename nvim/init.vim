call plug#begin()
  Plug 'dylanaraps/wal'
	Plug 'rakr/vim-one'
	Plug 'elzr/vim-json'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
	Plug 'prettier/vim-prettier', {'do': 'yarn install'}
	Plug 'jiangmiao/auto-pairs'
  Plug 'lilydjwg/colorizer'
  Plug 'mhartington/vim-typings'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'w0rp/ale'
  Plug 'huyvohcmc/atlas.vim'
  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  Plug 'greymd/oscyank.vim'
  Plug 'ayu-theme/ayu-vim'
call plug#end()

setlocal spell spelllang=en_us
set termguicolors     " enable true colors support
let ayucolor="dark"  " for light version of theme
colorscheme ayu

nnoremap <C-f> :Files<Cr>
nnoremap <C-g> :Ag<Cr>
nnoremap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <Leader>i :ALEFix<CR>
nmap <Leader>a <Plug>GitGutterStageHunk
nmap <Leader>r <Plug>GitGutterUndoHunk

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:ale_fixers = ['prettier', 'eslint']
nmap <leader>i <Plug>(ale_fix)
let g:ale_completion_enabled = 1
syntax enable

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

set number relativenumber
let g:enable_bold_font = 1
let g:enbale_italic_font = 1
set mouse=a

let g:nvim_typescript#type_info_on_hold = 1
let g:nvim_typescript#signature_complete = 1

set splitbelow
set splitright
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
noremap <leader>y :Oscyank<cr>

set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
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

" Coc.nvim
let g:coc_global_extensions = ['coc-emoji', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-tslint', 'coc-tslint-plugin', 'coc-css', 'coc-json', 'coc-pyls', 'coc-yaml']

" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use `lp` and `ln` for navigate diagnostics
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lf <Plug>(coc-references)

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
