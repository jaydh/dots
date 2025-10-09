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
    {'rebelot/kanagawa.nvim'},
    {'L3MON4D3/LuaSnip'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
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
    {'stsewd/isort.nvim'},
    {
      "cuducos/yaml.nvim",
      ft = { "yaml" }, -- optional
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim", -- optional
      },
    }
})

vim.g.neoformat_enabled_python = { 'yapf' }

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['tsserver'] = {'javascript', 'typescript'},
    ['rust_analyzer'] = {'rust'},
  }
})


vim.lsp.config('rust_analyzer', {
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

vim.lsp.config('ts_ls', {
    capabilities = capabilities
})

vim.lsp.config('gopls', {
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

vim.lsp.config('pyright', {})
vim.lsp.config('pylsp', {
 settings = {
        pylsp = {
            plugins = {
                flake8 = {
                    enabled = true,
                    maxLineLength = 88,
                },
                pylsp_mypy = {
                    enabled = false,
                    live_mode = true,
                },
             }
        }
    }
})

vim.lsp.enable('pylsp')
vim.lsp.enable('pyright')
vim.lsp.enable('gopls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('rust_analyzer')


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
