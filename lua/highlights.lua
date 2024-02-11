---@class CustomHighlight
---@field fg? CtpColor|string (or foreground) color name or "#RRGGBB", see note.
---@field bg? CtpColor|string (or background) color name or "#RRGGBB", see note.
---@field sp? string (or special) color name or "#RRGGBB"
---@field blend? integer between 0 and 100
---@field bold? boolean
---@field standout? boolean
---@field underline? boolean
---@field undercurl? boolean
---@field underdouble? boolean
---@field underdotted? boolean
---@field underdashed? boolean
---@field strikethrough? boolean
---@field italic? boolean
---@field reverse? boolean
---@field nocombine? boolean
---@field link? string name of another highlight group to link to, see
---@field default? boolean Don't override existing definition |hi-default|
---@field ctermfg? string Sets foreground of cterm color |ctermfg|
---@field ctermbg? string Sets background of cterm color |ctermbg|
---@field cterm? string cterm attribute map, like |highlight-args|

---@alias CustomHighlights table<string|string[], CustomHighlight>

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
    LineNr = { fg = 'blue', bold = true },
    ColorColumn = { bg = 'surface0' },
    [{ 'LineNrAbove', 'LineNrBelow' }] = { fg = 'surface2' },
}

register_hl(highlights)

return { register_hl = register_hl }
