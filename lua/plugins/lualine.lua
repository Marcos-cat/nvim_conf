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

local function word_count()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local content = table.concat(lines, ' ')
    local _, words = content:gsub('%[[xX]%]', ' '):gsub('%a+', '')
    return words
end

local function word_count_cond()
    local ft = vim.bo.filetype
    return ft == 'markdown' or ft == 'text'
end

---@param file string
local function file_name_fmt(file)
    local oil_dir = file:gsub('^oil://', ''):gsub('^o//', '')
    if oil_dir == file then return file end

    local cwd = vim.fn.getcwd()
    local escaped_cwd = cwd:gsub('%W', '%%%0')
    oil_dir = oil_dir:gsub('^' .. escaped_cwd .. '%/', '')

    if oil_dir == '' then return cwd end
    return oil_dir
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
                { word_count, cond = word_count_cond },
            },
            lualine_b = { { 'branch', icon = '' }, 'diff' },
            lualine_c = { 'diagnostics' },

            lualine_x = {
                {
                    'filename',
                    path = path.relative,
                    fmt = file_name_fmt,
                },
            },
            lualine_y = { 'filetype', { lsps_display } },
            lualine_z = { 'progress' },
        },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
}
