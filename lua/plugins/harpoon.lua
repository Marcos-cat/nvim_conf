local function harpoon() return require 'harpoon' end

---@type LazySpec
return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    opts = {},
    config = function(_, opts) harpoon():setup(opts) end,

    keys = {
        { '<leader>a', function() harpoon():list():append() end, desc = 'Harpoon Add', },
        { '<leader>A', function() harpoon().ui:toggle_quick_menu(harpoon():list()) end, desc = 'Harpoon Show', },
        { '<C-h>', function() harpoon():list():select(1) end, desc = 'Harpoon 1' },
        { '<C-j>', function() harpoon():list():select(2) end, desc = 'Harpoon 2' },
        { '<C-k>', function() harpoon():list():select(3) end, desc = 'Harpoon 3' },
        { '<C-l>', function() harpoon():list():select(4) end, desc = 'Harpoon 4' },
        { '<Tab>', function() harpoon():list():next() end, desc = 'Harpoon Next' },
        { '<S-Tab>', function() harpoon():list():prev() end, desc = 'Harpoon Prev' },
    },

    dependencies = { 'nvim-lua/plenary.nvim' },
}
