local color = require 'catppuccin.palettes.mocha'

local opts = {
    override = {
        txt = { '󰈙', color.text },
        ua = { '󰕉', color.sapphire },
        [{ 'ml', 'mli' }] = { '', color.yellow },
        [{ 'go.mod', 'go.sum' }] = { '󰟓', color.sapphire },
    },
}

for k, v in pairs(opts.override) do
    if type(k) == 'table' then
        for ft in ipairs(k) do
            opts.override[ft] = v
        end
        opts.override[k] = nil
    end
end

for k, v in pairs(opts.override) do
    opts.override[k] = {
        icon = v[1],
        color = v[2],
        name = k,
    }
end

---@type LazySpec
return {
    lazy = false,
    'nvim-tree/nvim-web-devicons',
    opts = opts,
}
