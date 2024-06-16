---@type LazySpec
return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = false,
    ---@module "catppuccin"
    ---@type CatppuccinOptions
    opts = {
        flavour = 'mocha',
        kitty = true,
        integrations = { notify = true, noice = true, telescope = true },
    },
    config = function(_, opts)
        require('catppuccin').setup(opts)
        vim.cmd.colorscheme 'catppuccin-mocha'
    end,
}
