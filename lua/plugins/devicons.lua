local color = require 'catppuccin.palettes.mocha'

local opts = {
    strict = true,
    override_by_extension = {
        lua = { '', color.blue },
        json = { '', color.yellow },
        rs = { '󱘗', color.peach },
        toml = { '', color.green },
        lock = { '', color.red },
        ts = { '', color.sapphire },
        js = { '', color.yellow },
        css = { '', color.blue },
        html = { '󰌝', color.red },
        go = { '', color.sapphire },
        sh = { '', color.overlay0 },
        py = { '󰌠', color.sky },
        md = { '󰍔', color.red },
        txt = { '󰈙', color.text },
        ml = { '', color.yellow },
    },
    override_by_filename = {
        ['go.mod'] = { '󰟓', color.sapphire },
        ['go.sum'] = { '󰟓', color.sapphire },
    },
}
for _, t in ipairs { opts.override_by_extension, opts.override_by_filename } do
    for name, v in pairs(t) do
        t[name] = {
            icon = v[1],
            color = v[2],
            name = name,
        }
    end
end

---@type LazySpec
return { 'nvim-tree/nvim-web-devicons', opts = opts }
