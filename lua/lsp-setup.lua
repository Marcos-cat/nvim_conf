local register_mappings = require('keymaps').register_mappings
local tb = require 'telescope.builtin'
local lsp = vim.lsp.buf

local on_attach = function(_, bufnr)
    ---@type CustomMapping[]
    local mappings = {
        -- { '<leader>ra', lsp.rename, desc = 'Rename' }, -- [[ Uses IncRename instead ]]
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
    bashls = {},
    jdtls = {},
    cssls = {},
    svelte = {},
    ocamllsp = {},
    taplo = {},
    htmx = {},
    vimls = {},
    tsserver = {},
    html = {},
    templ = {},
    gopls = {},
    pyright = {},

    clangd = { filetypes = { 'c', 'cpp' } },

    rust_analyzer = {
        cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
        filetypes = { 'rust' },
        ['rust-analyzer'] = { cargo = { allFeatures = true } },
    },

    ltex = {
        autostart = false,
        ltex = {
            completionEnabled = true,
            dictionary = { ['en-US'] = { 'uiua', 'nvim', 'vim', 'todo' } },
            checkFrequency = 'save',
        },
    },

    jsonls = {
        -- TODO schema store stuff
        filetypes = { 'json', 'jsonc' },
    },

    emmet_language_server = { filetypes = { 'html', 'svelte', 'templ' } },

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
            cmd = (servers[server_name] or {}).cmd,
            root_dir = (servers[server_name] or {}).root_dir,
            filetypes = (servers[server_name] or {}).filetypes,
            autostart = (servers[server_name] or {}).autostart,
        }
    end,
}
