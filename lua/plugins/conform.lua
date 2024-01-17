local opts = {
    formatters_by_ft = {
        lua = { 'stylua' },
        rust = { 'rustfmt' },
        python = { 'black' },
        go = { 'gofmt' },
        templ = { 'templ' },
        svelte = { 'svelteprettier' },

        javascript = { 'prettier' },
        typescript = { 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        html = { 'prettier' },
        css = { 'prettier' },

        bash = { 'shfmt' },
        sh = { 'shfmt' },

        java = { 'clang_format' },
        cpp = { 'clang_format' },
        c = { 'clang_format' },

        markdown = { 'mdformat' },
    },
}

local path = '/home/marcospotato/.config/'

local pre_args = {
    stylua = { '-f', path .. 'stylua/.stylua.toml' },
    prettier = { '--config', path .. 'prettier/.prettierrc' },
    clang_format = { '-style=file:' .. path .. 'clang/.clang-format' },
    mdformat = { '--number', '--wrap', '80' },
}

local function config()
    local conform = require 'conform'
    local util = require 'conform.util'

    conform.formatters.svelteprettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '$FILENAME' },
        range_args = function(ctx)
            local start_offset, end_offset =
                util.get_offsets_from_range(ctx.buf, ctx.range)
            return {
                '$FILENAME',
                '--range-start=' .. start_offset,
                '--range-end=' .. end_offset,
            }
        end,
    }

    for formatter, args in pairs(pre_args) do
        conform.formatters[formatter] = { prepend_args = args }
    end

    conform.setup(opts)
end

---@type LazySpec
return {
    'stevearc/conform.nvim',
    config = config,
    ft = vim.tbl_keys(opts.formatters_by_ft),
    keys = {
        {
            '<leader>fm',
            function()
                require('conform').format()
            end,
            desc = 'Format',
        },
    },
}
