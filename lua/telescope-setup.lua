local tb = require 'telescope.builtin'

local register_mappings = require('keymaps').register_mappings

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

---@type CustomMapping[]
local mappings = {
    { '<leader>ff', tb.find_files, desc = 'Search Files' },
    { '<leader>fh', tb.help_tags, desc = 'Search Help' },
    { '<leader>fw', tb.live_grep, desc = 'Find Words' },
}

register_mappings(mappings)
