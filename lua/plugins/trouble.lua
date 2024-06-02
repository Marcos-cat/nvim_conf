---@type LazySpec[]
return {
    {
        'folke/trouble.nvim',
        opts = {},
        cmd = 'Trouble',
        keys = {
            {
                '<leader>q',
                function()
                    require('trouble').open { focus = true, mode = 'diagnostics' }
                end,
                'Trouble Diagnostics',
            },
        },
    },
    {
        'folke/todo-comments.nvim',
        event = 'BufEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {},
        keys = {
            {
                '<leader>td',
                function() require('trouble').open { mode = 'todo' } end,
                'Trouble Todos',
            },
        },
    },
}
