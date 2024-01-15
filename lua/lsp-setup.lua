local register_mappings = require('keymaps').register_mappings
local tb = require 'telescope.builtin'
local lsp = vim.lsp.buf

local on_attach = function(_, bufnr)
    ---@type LazyKeys[]
    local mappings = {
        { '<leader>ra', lsp.rename, desc = 'Rename' },
        { '<leader>ca', lsp.code_action, desc = 'Code Action' },
        { 'gd', tb.lsp_definitions, desc = 'Goto Definition' },
        { 'gr', tb.lsp_references, desc = 'Goto References' },
        { 'gI', tb.lsp_implementations, desc = 'Goto Implementation' },
        { '<leader>D', tb.lsp_type_definitions, desc = 'Type Definition' },
        { '<leader>ds', tb.lsp_document_symbols, desc = 'Document Symbols' },
        { 'K', lsp.hover, 'Hover Documentation' },
        { '<C-k>', lsp.signature_help, desc = 'Signature Documentation' },
        { 'gD', lsp.declaration, desc = 'Goto Declaration' },
    }

    for _, map in ipairs(mappings) do
        map.buffer = bufnr
    end

    register_mappings(mappings)
end

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

local servers = {
    clangd = {},
    gopls = {},
    pyright = {},
    rust_analyzer = {},
    tsserver = {},
    html = {},

    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { disable = { 'missing-fields' } },
        },
    },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        }
    end,
}
