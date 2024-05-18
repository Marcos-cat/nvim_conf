---@type LazySpec
return {
    'stevearc/oil.nvim',
    lazy = false,
    opts = {
        keymaps = { ['<leader>q'] = 'actions.close' },
        float = { max_width = 50, max_height = 20 },
        delete_to_trash = true,
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        { '-', function() require('oil').open_float() end, desc = 'Oil' },
    },
}
