---@type LazySpec
return {
    'brenoprata10/nvim-highlight-colors',
    event = 'VeryLazy',
    init = function() vim.o.t_Co = 256 end,
    opts = {},
}
