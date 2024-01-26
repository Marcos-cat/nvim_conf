local ls = require 'luasnip'
local s, i, t = ls.s, ls.insert_node, ls.text_node
local f, c = ls.function_node, ls.choice_node

local fmt = require('luasnip.extras.fmt').fmt

local snippets = {
    lua = {
        s('--t', fmt([[---@type {}]], i(0))),
    },
}

for fts, snip in pairs(snippets) do
    if type(fts) == 'table' then
        for _, ft in ipairs(fts) do
            ls.add_snippets(ft, snip)
        end
    end
    ls.add_snippets(fts, snip)
end

return {}
