---@type NoiceConfig
local noice_opts = {
    lsp = {
        -- hover = { enabled = false },
        -- signature = { enabled = false },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,
    },

    routes = {
        {
            filter = {
                event = 'msg_show',
                kind = '',
                find = 'written',
            },
            opts = { skip = true },
        },
    },
}

---@type LazySpec
return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = noice_opts,
    dependencies = {
        'MunifTanjim/nui.nvim',
        { 'smjonas/inc-rename.nvim', opts = {} },
        {
            'rcarriga/nvim-notify',
            opts = {
                render = 'compact',
                stages = 'fade',
                timeout = 2000,
                fps = 60,
            },
        },
    },
}
