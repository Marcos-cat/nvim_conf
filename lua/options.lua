vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        if vim.fn.argc() == 0 then vim.cmd 'Telescope find_files' end
    end,
})

local yank_group =
    vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    group = yank_group,
    pattern = '*',
})

vim.filetype.add { extension = { ua = 'uiua' } }

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.foldmethod = 'manual'

-- Open vertical splits to the right
vim.o.splitright = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.g.vim_markdown_frontmatter = 1
vim.g.rustfmt_autosave = 1

vim.opt.sidescroll = 0

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'

vim.opt.updatetime = 50

vim.opt.colorcolumn = '80'
vim.opt.mouse = ''

vim.opt.clipboard = 'unnamed'

vim.lsp.set_log_level(4)
