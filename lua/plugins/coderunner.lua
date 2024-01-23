---@type LazySpec
return {
    'CRAG666/code_runner.nvim',
    opts = {
        filetype = {
            rust = { 'cargo run' },
            typescript = 'bun run',
            go = { 'go run .' },
        },
    },
    -- keys = { { '<leader>ru', run, desc = 'Run Code' } },
}
