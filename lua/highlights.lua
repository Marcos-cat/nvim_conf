---@alias CustomHighlights table<string|string[], vim.api.keyset.highlight>

local set_hl = vim.api.nvim_set_hl

local colors = require 'catppuccin.palettes.mocha'

---@param hls CustomHighlights
local register_hl = function(hls)
    for hlgroups, opts in pairs(hls) do
        opts.bg = colors[opts.bg] or opts.bg
        opts.fg = colors[opts.fg] or opts.fg

        if type(hlgroups) == 'table' then
            for _, hlgroup in ipairs(hlgroups) do
                set_hl(0, hlgroup, opts)
            end
        else
            set_hl(0, hlgroups, opts)
        end
    end
end

---@type CustomHighlights
local highlights = {
    SpellBad = { underline = true },
    LineNr = { fg = 'blue', bold = true },
    ColorColumn = { bg = 'surface0' },
    [{ 'LineNrAbove', 'LineNrBelow' }] = { fg = 'surface2' },
}

register_hl(highlights)

return { register_hl = register_hl }
