local opts = {
    filetype = {
        rust = { 'cargo run' },
        typescript = 'bun run',
    },
}

return { 'CRAG666/code_runner.nvim', opts = opts }
