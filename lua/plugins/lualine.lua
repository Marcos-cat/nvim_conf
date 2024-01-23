local api = vim.api

local macro = {
    recording = false,
    register = nil,
}

function macro.display()
    if not macro.recording then return '' end
    return '@' .. macro.register
end

local group = api.nvim_create_augroup('MacroLualine', { clear = true })

api.nvim_create_autocmd('RecordingEnter', {
    callback = function()
        macro.recording = true
        macro.register = tostring(vim.fn.reg_recording())
        require('lualine').refresh()
    end,
    group = group,
})

api.nvim_create_autocmd('RecordingLeave', {
    callback = function()
        macro.recording = false
        macro.register = nil
        require('lualine').refresh()
    end,
    group = group,
})

local path = {
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
            lualine_a = { { 'mode' }, { macro.display } },
            lualine_b = { { 'branch', icon = '' }, 'diff' },
            lualine_c = { 'diagnostics' },

            lualine_x = { { 'filename', path = path.relative } },
            lualine_y = { 'filetype' },
            lualine_z = { 'progress' },
        },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
}
