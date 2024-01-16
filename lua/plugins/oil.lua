local opts = {
    keymaps = { ['q'] = 'actions.close' },
    float = { max_width = 100, max_height = 30 },
    delete_to_trash = true,
}

---@type LazySpec
return {
    'stevearc/oil.nvim',
    opts = opts,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        {
            '-',
            function()
                require('oil').open_float()
            end,
            desc = 'Oil',
        },
    },
}
