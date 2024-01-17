---@enum PathType
local PathType = {
    name = 0,
    relative = 1,
    absolute = 2,
}

return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    opts = {
        options = {
            icons_enabled = true,
            theme = 'catppuccin-mocha',
            component_separators = '|',
            section_separators = '',
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { { 'branch', icon = '' }, 'diff' },
            lualine_c = { 'diagnostics' },

            lualine_x = { { 'filename', path = PathType.relative } },
            lualine_y = { 'filetype' },
            lualine_z = { 'progress' },
        },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
}
