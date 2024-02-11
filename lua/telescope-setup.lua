require('telescope').setup {
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            height = 0.95,
            preview_cutoff = 80,
            width = 0.9,
        },
        prompt_prefix = '   ',
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
}

require('highlights').register_hl { TelescopePromptPrefix = { fg = 'red' } }

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

local tb = require 'telescope.builtin'

---@type CustomMapping[]
local mappings = {
    { '<leader>ff', tb.find_files, desc = 'Find Files' },
    {
        '<leader>fa',
        function() tb.find_files { hidden = true } end,
        desc = 'Find All Files',
    },
    { '<leader>fh', tb.help_tags, desc = 'Find Help' },
    { '<leader>fw', tb.live_grep, desc = 'Find Words' },
}

require('keymaps').register_mappings(mappings)
