local opts = {
    keymaps = { ['<leader>q'] = 'actions.close' },
    float = { max_width = 50, max_height = 20 },
    delete_to_trash = true,
}

---@type LazySpec
return {
    'stevearc/oil.nvim',
    lazy = false,
    opts = opts,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        {
            '-',
            function() require('oil').open_float() end,
            desc = 'Oil',
        },
    },
}
