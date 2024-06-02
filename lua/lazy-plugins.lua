---@type LazySpec[]
require('lazy').setup({
    {
        'mbbill/undotree',
        cmd = 'UndotreeToggle',
        keys = { { '<leader>u', '<cmd>UndotreeToggle<CR>', 'Undotree' } },
    },
    { 'tpope/vim-surround', event = 'VeryLazy' },
    { 'tpope/vim-repeat', event = 'VeryLazy' },
    { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },
    {
        'onsails/lspkind.nvim',
        opts = {},
        config = function(_, opts) require('lspkind').init(opts) end,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            {
                'stevearc/dressing.nvim',
                opts = {
                    input = {
                        win_options = {
                            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,Search:None',
                        },
                    },
                },
            },
            {
                'folke/lazydev.nvim',
                ft = 'lua', -- only load on lua files
                opts = { library = { 'lazy.nvim' } },
            },
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
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

    { 'folke/which-key.nvim', opts = {}, event = 'VeryLazy' },
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
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
        'lukas-reineke/indent-blankline.nvim',
        name = 'ibl',
        event = 'VeryLazy',
        opts = { indent = { char = '│' }, scope = { enabled = false } },
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function() return vim.fn.executable 'make' == 1 end,
            },
        },
    },

    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        build = ':TSUpdate',
    },

    { import = 'plugins' },
}, { defaults = { lazy = true } })
