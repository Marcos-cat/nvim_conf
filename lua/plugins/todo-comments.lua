---@type LazySpec
return {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ---@type TodoConfig
    opts = {},
}
