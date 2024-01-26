local path = {
    name = 0,
    relative = 1,
    absolute = 2,
}

local function macro_display()
    local reg = vim.fn.reg_recording()
    if reg == '' then return '' end
    return '@' .. reg
end

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
            lualine_a = { { 'mode' }, { macro_display } },
            lualine_b = { { 'branch', icon = '' }, 'diff' },
            lualine_c = { 'diagnostics' },

            lualine_x = { { 'filename', path = path.relative } },
            lualine_y = { 'filetype' },
            lualine_z = { 'progress' },
        },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
}
