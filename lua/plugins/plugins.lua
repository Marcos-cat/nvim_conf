---@type LazySpec[]
return {
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
}
