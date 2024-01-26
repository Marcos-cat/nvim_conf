local fts = {
    'toml',
    'lua',

    'css',
    'html',
    'javascript',
    'typescript',

    'cpp',
    'c',
}

local opts = {}
local disabled = { names = false, RGB = false }

for _, ft in ipairs(fts) do
    opts[ft] = disabled
end

---@type LazySpec
return {
    'norcalli/nvim-colorizer.lua',
    ft = fts,
    opts = opts,
}
