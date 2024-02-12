local color = require 'catppuccin.palettes.mocha'

---@class IconInfo
---@field [1] string
---@field [2] string

---@class DeviconOpts
---@field strict boolean
---@field override_by_extension table<string|string[], IconInfo>
---@field override_by_filename table<string|string[], IconInfo>
local opts = {
    strict = true,
    override_by_extension = {
        lua = { '', color.blue },
        json = { '', color.yellow },
        rs = { '󱘗', color.peach },
        svelte = { '', color.red },
        toml = { '', color.green },
        lock = { '', color.red },
        ts = { '', color.teal },
        vim = { '', color.green },
        ['d.ts'] = { '', color.green },
        js = { '', color.yellow },
        css = { '', color.blue },
        html = { '󰌝', color.red },
        go = { '', color.sapphire },
        sh = { '', color.overlay0 },
        py = { '󰌠', color.sky },
        md = { '', color.red },
        txt = { '󰈙', color.text },
        [{ 'ml', 'mli' }] = { '', color.yellow },
    },
    override_by_filename = {
        ['go.mod'] = { '󰟓', color.sapphire },
        ['go.sum'] = { '󰟓', color.sapphire },
    },
}

---@param filetype string
---@param icon_info IconInfo
local function to_devicon_table(filetype, icon_info)
    return {
        icon = icon_info[1],
        color = icon_info[2],
        name = filetype,
    }
end

for _, overrides in ipairs {
    opts.override_by_extension,
    opts.override_by_filename,
} do
    for filetype, icon_info in pairs(overrides) do
        if type(filetype) == 'table' then
            for _, ft in ipairs(filetype) do
                overrides[ft] = to_devicon_table(ft, icon_info)
            end

            overrides[filetype] = nil
        else
            overrides[filetype] = to_devicon_table(filetype, icon_info)
        end
    end
end

---@type LazySpec
return { lazy = false, 'nvim-tree/nvim-web-devicons', opts = opts }
