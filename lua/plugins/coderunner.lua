_CODE_RUNNER_TERM = 69420

local function run()
    local cmd = require('code_runner.commands').get_filetype_command()
    local term = require 'betterTerm'

    print(vim.inspect(cmd))
    term.open(_CODE_RUNNER_TERM)
    term.select()
    term.send(cmd, _CODE_RUNNER_TERM, { interrupt = false })
end

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
    keys = { { '<leader>ru', run, desc = 'Run Code' } },
    dependencies = { 'CRAG666/betterTerm.nvim' },
}
