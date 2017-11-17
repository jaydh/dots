map <C-n> :NERDTreeToggle<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#parser = 'babylon'
let g:prettier#config#jsx_bracket_same_line = 'false'
call plug#begin()
	Plug 'prettier/vim-prettier', {'do':'yarn install'}
	Plug 'mxw/vim-jsx'
	Plug 'elzr/vim-json'
	Plug 'Shougo/deoplete.nvim', {'do': 'UpdateRemotePlugins'}
"	Plug 'mhartington/nvim-typescript', {'do': 'UpdateRemotePlugins'}
	Plug 'Quramy/tsuquyomi'
	Plug 'HerringtonDarkholme/yats.vim'
	Plug 'severin-lemaignan/vim-minimap'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/syntastic'
	Plug 'kien/ctrlp.vim'
	Plug 'bling/vim-airline'
	Plug 'pangloss/vim-javascript'

call plug#end()
