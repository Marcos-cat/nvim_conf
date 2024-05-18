---@type LazySpec[]
return {
    {
        'folke/trouble.nvim',
        opts = {},
        keys = {
            {
                '<leader>q',
                function() require('trouble').open 'document_diagnostics' end,
                'Trouble Diagnostics',
            },
        },
    },
    {
        'folke/todo-comments.nvim',
        event = 'BufEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        ---@type TodoConfig
        opts = {},
        keys = {
            {
                '<leader>td',
                function() require('trouble').open 'todo' end,
                'Trouble Todos',
            },
        },
    },
}
