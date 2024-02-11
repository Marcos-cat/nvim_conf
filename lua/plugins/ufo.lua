---@type LazySpec
return {
    'kevinhwang91/nvim-ufo',
    event = 'VeryLazy',

    opts = {
        provider_selector = function() return { 'treesitter', 'indent' } end,
    },

    init = function()
        vim.o.foldenable = true
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
    end,

    config = function(_, opts)
        require('ufo').setup(opts)

        require('highlights').register_hl {
            UfoFoldedEllipsis = { fg = 'surface2', bg = 'none' },
            Folded = { fg = 'none', bg = 'surface1', bold = true },
        }
    end,

    dependencies = { 'kevinhwang91/promise-async' },
}
