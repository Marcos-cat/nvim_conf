---@type LazySpec[]
require('lazy').setup({
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',

            'folke/neodev.nvim',
        },
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',

            'rafamadriz/friendly-snippets',
        },
    },

    { 'folke/which-key.nvim', opts = {} },
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        ---@type CatppuccinOptions
        opts = {
            flavour = 'mocha',
            -- custom_highlights = function(colors)
            --     return {
            --         ['@punctuation.bracket'] = { fg = colors.red },
            --         ['@parameter'] = { fg = colors.red },
            --         ['@property'] = { fg = colors.red },
            --         ['@field'] = { fg = colors.red },
            --         ['@variable.builtin'] = { fg = colors.text },
            --         ['@constructor.lua'] = { fg = colors.sky },
            --         ['@operator'] = { fg = colors.subtext0 },
            --     }
            -- end,
        },
        config = function(_, opts)
            require('catppuccin').setup(opts)
            vim.cmd.colorscheme 'catppuccin-mocha'
        end,
    },
    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'catppuccin-mocha',
                component_separators = '|',
                section_separators = '',
            },
        },
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        name = 'ibl',
        ---@type ibl.config
        opts = {
            indent = { char = '│' },
            scope = {
                show_start = false
            }
        },
    },

    -- "gc" to comment visual regions/lines
    {
        'numToStr/Comment.nvim',
        ---@type CommentConfig
        opts = {}
    },

    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            -- Only load if `make` is available. Make sure you have the system
            -- requirements installed.
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                -- NOTE: If you are having trouble with this installation,
                --       refer to the README for telescope-fzf-native for more instructions.
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },

    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    { import = 'plugins' },
}, {})
