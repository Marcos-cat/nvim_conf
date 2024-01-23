local path = '/home/marcospotato/.config/'

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
    formatters = {
        svelteprettier = {
            command = 'prettier',
            args = { '--stdin-filepath', '$FILENAME' },
            range_args = function(ctx)
                local start_offset, end_offset =
                    require('conform.util').get_offsets_from_range(
                        ctx.buf,
                        ctx.range
                    )
                return {
                    '$FILENAME',
                    '--range-start=' .. start_offset,
                    '--range-end=' .. end_offset,
                }
            end,
        },
    },
}

local prepend_args = {
    stylua = { '-f', path .. 'stylua/.stylua.toml' },
    prettier = { '--config', path .. 'prettier/.prettierrc' },
    clang_format = { '-style=file:' .. path .. 'clang/.clang-format' },
    mdformat = { '--number', '--wrap', '80' },
}

for formatter, args in pairs(prepend_args) do
    opts.formatters[formatter] = { prepend_args = args, inherit = true }
end

---@type LazySpec
return {
    'stevearc/conform.nvim',
    opts = opts,
    ft = vim.tbl_keys(opts.formatters_by_ft),
    keys = {
        {
            '<leader>fm',
            function() require('conform').format() end,
            desc = 'Format',
        },
    },
}
