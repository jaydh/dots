local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop

-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {'github/copilot.vim'},
    {'L3MON4D3/LuaSnip'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'drewtempelmeyer/palenight.vim'},
    {'elzr/vim-json'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/vim-vsnip'},
    {'hrsh7th/nvim-cmp'},
    {'LunarWatcher/auto-pairs'},
    {'lilydjwg/colorizer'},
    {'lukas-reineke/indent-blankline.nvim'},
    {'neovim/nvim-lspconfig'},
    {'nvim-lua/plenary.nvim'},
    {'nvim-telescope/telescope.nvim'},
    {'nvim-tree/nvim-web-devicons'},
    {'rust-lang/rust.vim'},
    {'tpope/vim-fugitive'},
    {'tpope/vim-surround'},
    {'tpope/vim-vinegar'},
    {'rafamadriz/friendly-snippets'},
    {'sbdchd/neoformat'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
})

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local nvim_lsp = require'lspconfig'

nvim_lsp.rust_analyzer.setup({
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
                features = "all"
            },
            procMacro = {
              ignored = {
                leptos_macro = {
                  -- optional: --
                  -- "component",
                  "server",
                },
              },
            },
            server = {
              extraEnv = {
                ["RA_SESSION_CHANGE_DEBOUNCE"] = "1000" -- in milliseconds
              }
            }

        }
    }
})

nvim_lsp.ts_ls.setup {
    capabilities = capabilities
}

nvim_lsp.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})


local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_format = require('lsp-zero').cmp_format({details = true})

cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {},
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),}),

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, 
      { name = 'buffer' },
    })
})

cmp.setup.filetype('gitcommit', {
    sources = {
      { name = 'git' },
      { name = 'buffer' },
    }
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'path' },
      { name = 'cmdline' },
    }
})

