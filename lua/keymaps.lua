local function cmd(s) return '<cmd> ' .. s .. ' <CR>' end

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

---@alias MapModes 'c'|'x'|'v'|'n'|'i'|'t'

---@class CustomMapping
---@field [1] string
---@field [2] string|function
---@field desc? string
---@field mode? MapModes|MapModes[]
---@field buffer? integer

---@type CustomMapping[]
local mappings = {
    { '<leader>sa', ':w <CR>', desc = 'Save' },
    { '<BS>', cmd 'e #', desc = 'Previous Buffer' },
    { 'g>', '<C-a>', desc = 'Increment' },
    { 'g<', '<C-x>', desc = 'Decrement' },
    { '<leader>ra', ':IncRename ', desc = 'Rename' },
    { 'D', '<C-d>zz' },
    { 'U', '<C-u>zz' },
    { 'J', 'mzJ`z' },

    -- [[ Copy/Paste ]]

    { 'p', '""p', mode = { 'v', 'x', 'n' } },
    { '<leader>p', '"+p""', mode = { 'v', 'x', 'n' } },
    { 'y', '""y', mode = { 'v', 'x', 'n' } },
    { 'y', '""y', mode = { 'v', 'x', 'n' } },

    { '<Esc>', [[<C-\><C-n>]], mode = { 't' }, desc = 'Exit terminal mode' },
    { 'y', '""y', mode = { 'v', 'x', 'n' } },
    { '<leader>y', '"+y', mode = { 'v', 'x', 'n' } },

    { '<C-c>', 'mzgg"+yG`z', 'Copy the file to clipboard' },
}

---@param map_table CustomMapping[]
local function register_mappings(map_table)
    for _, map in ipairs(map_table) do
        local lhs = map[1]
        local rhs = map[2]
        local mode = map.mode or 'n'

        local opts = {}
        for k, v in pairs(map) do
            if type(k) == 'string' and k ~= 'mode' then opts[k] = v end
        end

        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

register_mappings(mappings)

local highlight_group =
    vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    group = highlight_group,
    pattern = '*',
})

return { register_mappings = register_mappings }
