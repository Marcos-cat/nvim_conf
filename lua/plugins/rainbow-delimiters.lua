local function rd(s) return 'RainbowDelimiter' .. s end

---@type LazySpec
return {
    'hiphish/rainbow-delimiters.nvim',
    event = 'BufEnter',
    opts = {
        query = { [''] = 'rainbow-delimiters', svelte = 'rainbow-delimiters' },
        highlight = { rd 'Red', rd 'Violet', rd'Orange', rd 'Blue' },
        -- blacklist = { 'html' },
    },
    config = function(_, opts) require('rainbow-delimiters.setup').setup(opts) end,
}
