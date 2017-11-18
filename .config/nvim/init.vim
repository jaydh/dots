syntax enable
let g:airline_theme='oceanicnext'
map <C-n> :NERDTreeToggle<CR>
map <Leader>i <Plug>(Prettier)
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
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#parser = 'babylon'
let g:prettier#config#jsx_bracket_same_line = 'false'
call plug#begin()
	Plug 'othree/yajs.vim'
	Plug 'othree/html5.vim'
	Plug 'mhartington/oceanic-next'
	Plug 'mxw/vim-jsx'
	Plug 'elzr/vim-json'
	Plug 'Shougo/deoplete.nvim', {'do': 'UpdateRemotePlugins'}
	Plug 'mhartington/nvim-typescript', {'do': 'UpdateRemotePlugins'}
	Plug 'HerringtonDarkholme/yats.vim'
	Plug 'nightsense/carbonized'
	Plug 'severin-lemaignan/vim-minimap'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/syntastic'
	Plug 'bling/vim-airline'
	Plug 'prettier/vim-prettier', {'do': 'yarn install'}

call plug#end()
