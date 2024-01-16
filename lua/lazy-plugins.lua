---@type LazySpec[]
require('lazy').setup({
    {
        'norcalli/nvim-colorizer.lua',
        event = 'VeryLazy',
        opts = { ['*'] = { names = false, RGB = false } },
    },
    { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },
    {
        'folke/trouble.nvim',
        opts = {},
        keys = {
            {
                '<leader>q',
                function()
                    require('trouble').open()
                end,
                'Trouble',
            },
        },
    },
    {
        'onsails/lspkind.nvim',
        opts = {},
        config = function(_, opts)
            require('lspkind').init(opts)
        end,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
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
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enabled = true,
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
                show_start = false,
            },
        },
    },

    {
        'numToStr/Comment.nvim',
        opts = {},
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },

    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    { import = 'plugins' },
}, {})
