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

local function lsps_display()
    local lsps = vim.lsp.get_active_clients { bufnr = 0 }
    for i, lsp in ipairs(lsps) do
        lsps[i] = lsp.name
    end

    if #lsps == 0 then return '' end

    return table.concat(lsps, ' '):gsub('language_server', 'ls')
end

local nvim_icon = {
    filled = '',
    unfilled = '',
}

return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    opts = {
        options = {
            icons_enabled = true,
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
        },
        sections = {
            lualine_a = {
                { 'mode', icon = nvim_icon.unfilled },
                { macro_display },
            },
            lualine_b = { { 'branch', icon = '' }, 'diff' },
            lualine_c = { 'diagnostics' },

            lualine_x = { { 'filename', path = path.relative } },
            lualine_y = { 'filetype', { lsps_display } },
            lualine_z = { 'progress' },
        },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
}
