local function cmd(s) return '<cmd> ' .. s .. ' <CR>' end

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

---@alias MapMode 'c'|'x'|'v'|'n'|'i'|'t'

---@class CustomMapping
---@field [1] string
---@field [2] string|function
---@field desc? string
---@field mode? MapMode|MapMode[]
---@field buffer? integer

---@type CustomMapping[]
local mappings = {
    { 'j', 'gj' },
    { 'k', 'gk' },
    { 'gj', 'j' },
    { 'gk', 'k' },
    { '<BS>', cmd 'e #', desc = 'Previous Buffer' },
    { 'D', '<C-d>zz' },
    { 'U', '<C-u>zz' },
    { 'J', 'mzJ`z' },

    -- [[ Copy/Paste ]]

    { 'p', '""p', mode = { 'v', 'x', 'n' } },
    { 'y', '""y', mode = { 'v', 'x', 'n' } },

    { 'gp', '"+p', mode = { 'v', 'x', 'n' } },
    { 'gy', '"+y', mode = { 'v', 'x', 'n' } },

    { '<Esc>', [[<C-\><C-n>]], mode = { 't' }, desc = 'Exit terminal mode' },

    { '<C-c>', 'mzgg"+yG`z', 'Copy the file to clipboard' },
}

vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('W', 'w', {})

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

return { register_mappings = register_mappings }
