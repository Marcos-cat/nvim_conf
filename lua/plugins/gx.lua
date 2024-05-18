---@type LazySpec
return {
    'chrishrb/gx.nvim',
    opts = {},
    keys = { { 'gx', '<cmd>Browse<CR>', mode = { 'n', 'x' } } },
    cmd = 'Browse',
    dependencies = { 'nvim-lua/plenary.nvim' },
    submodules = false,
}
