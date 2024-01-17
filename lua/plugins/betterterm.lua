---@type LazySpec
return {
    'CRAG666/betterTerm.nvim',
    opts = {
        startInserted = true,
        position = 'bot', ---@type "bot"|"vert"
        size = 12,
    },
    keys = {
        {
            '<leader>to',
            function()
                require('betterTerm').open()
            end,
        },
    },
}
