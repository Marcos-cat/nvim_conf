---@alias CustomHighlights table<string|string[], vim.api.keyset.highlight>

local colors = require 'catppuccin.palettes.mocha'

---@param hls CustomHighlights
local register_hl = function(hls)
    for hlgroups, opts in pairs(hls) do
        opts.bg = colors[opts.bg] or opts.bg
        opts.fg = colors[opts.fg] or opts.fg

        if type(hlgroups) == 'table' then
            for _, hlgroup in ipairs(hlgroups) do
                vim.api.nvim_set_hl(0, hlgroup, opts)
            end
        else
            vim.api.nvim_set_hl(0, hlgroups, opts)
        end
    end
end

---@type CustomHighlights
local highlights = {
    LineNr = { fg = 'blue', bold = true },
    ColorColumn = { link = 'CursorLine' },
    [{ 'LineNrAbove', 'LineNrBelow' }] = { fg = 'surface1', italic = true },
}

local function modify(name, opts)
    vim.api.nvim_set_hl(
        0,
        name,
        vim.tbl_extend('keep', opts, vim.api.nvim_get_hl(0, { name = name }))
    )
end

for _, name in ipairs { 'Error', 'Warn', 'Info', 'Hint' } do
    modify('DiagnosticVirtualText' .. name, { italic = false })
end

modify('Conditional', { italic = false })
modify('Type', { italic = true })

register_hl(highlights)

return { register_hl = register_hl }
