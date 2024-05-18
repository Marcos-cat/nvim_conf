local color = require 'catppuccin.palettes.mocha'

local opts = {
    override = {
        txt = { '󰈙', color.text },
        ua = { '󰕉', color.sapphire },
        [{ 'go.mod', 'go.sum' }] = { '󰟓', color.sapphire },
    },
}

for k, v in pairs(opts.override) do
    if type(k) == 'table' then
        for _, ft in ipairs(k) do
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

    'dgox16/devicon-colorscheme.nvim',

    opts = {
        colors = {
            blue = color.blue,
            cyan = color.sky,
            green = color.green,
            magenta = color.pink,
            orange = color.peach,
            purple =  color.mauve,
            red = color.red,
            white = color.text,
            yellow = color.yellow,
            bright_blue = color.sapphire,
            bright_cyan = color.teal,
            bright_green = color.green,
            bright_magenta = color.flamingo,
            bright_orange = color.peach,
            bright_purple = color.lavender,
            bright_red = color.maroon,
            bright_yellow = color.rosewater,
        },
    },

    dependencies = {
        'nvim-tree/nvim-web-devicons',
        opts = opts,
    },
}
