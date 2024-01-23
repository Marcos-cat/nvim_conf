local color = require 'catppuccin.palettes.mocha'

---@class IconTable
---@field [1] string
---@field [2] string

---@class DeviconOpts
---@field strict boolean
---@field override_by_extension table<string|string[], IconTable>
---@field override_by_filename table<string|string[], IconTable>
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

---@param name string
---@param v IconTable
local function to_table(name, v)
    return {
        icon = v[1],
        color = v[2],
        name = name,
    }
end

for _, t in ipairs { opts.override_by_extension, opts.override_by_filename } do
    for key, v in pairs(t) do
        if type(key) == 'table' then
            for _, name in ipairs(key) do
                t[name] = to_table(name, v)
            end

            t[key] = nil
        else
            t[key] = to_table(key, v)
        end
    end
end

---@type LazySpec
return { 'nvim-tree/nvim-web-devicons', opts = opts }
