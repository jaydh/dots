call plug#begin()
    Plug 'elzr/vim-json'
    Plug 'lilydjwg/colorizer'
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'rust-lang/rust.vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'jiangmiao/auto-pairs'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'rust-lang/rust.vim'
    Plug 'nvim-tree/nvim-web-devicons'
call plug#end()

setlocal spell spelllang=en_us
set termguicolors     " enable true colors support
set t_Co=256   " This is may or may not needed.

set background=dark
colorscheme palenight

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

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
syntax enable
filetype plugin indent on

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

let g:enable_bold_font = 1
let g:enbale_italic_font = 1
let g:nvim_typescript#type_info_on_hold = 1
let g:nvim_typescript#signature_complete = 1

set cursorline
set mouse=a
set diffopt=vertical
set ts=4
set number relativenumber
set splitbelow
set splitright
set modelines=0
set backupcopy=yes
set tabstop=2
set shiftwidth=4
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
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

au FocusLost * :wa

nnoremap / /\v
vnoremap / /\vset ignorecase
noremap <leader>y :Oscyank<cr>
nnoremap <tab> %v
noremap <tab> %
nnoremap <leader><space> :noh<cr>
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
nnoremap <C-f> <cmd>Telescope find_files<cr>
nnoremap <C-g> <cmd>Telescope live_grep<cr>
nnoremap <c-x><c-l> <plug>(fzf-complete-line)
nmap <Leader>a <Plug>GitGutterStageHunk
nmap <Leader>r <Plug>GitGutterUndoHunk

autocmd BufRead,BufNewFile *.js,*.ts nnoremap <leader>i :%!prettier --write %<CR>:keepjumps e!<CR>
autocmd BufRead,BufNewFile *.rs nnoremap <leader>i :%!leptosfmt %<CR>:keepjumps e!<CR>

set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

lua <<EOF
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

local nvim_lsp = require'lspconfig'
local on_attach = function(client)
    require'completion'.on_attach(client)
end

nvim_lsp.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
                features = { "ssr" }
            },
            procMacro = {
                enable = true
            },
        }
    }
})

nvim_lsp.tsserver.setup {
    capabilities = capabilities
}

require'nvim-web-devicons'.setup {
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 color_icons = true;
 default = true;
 strict = true;
 override_by_filename = {
  [".gitignore"] = {
    icon = "",
    color = "#f1502f",
    name = "Gitignore"
  }
 };
 override_by_extension = {
  ["log"] = {
    icon = "",
    color = "#81e043",
    name = "Log"
  }
 };
}

EOF
