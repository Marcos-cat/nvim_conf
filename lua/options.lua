vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        if vim.fn.argc() == 0 then vim.cmd 'Telescope find_files' end
    end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
    pattern = '*',
})

vim.filetype.add { extension = { ua = 'uiua' } }

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.foldmethod = 'manual'

-- Open vertical splits to the right
vim.o.splitright = true

-- Set `completeopt` to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.termguicolors = true

vim.opt.sidescroll = 0

vim.o.nu = true
vim.o.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false -- Don't wrap lines

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

vim.opt.colorcolumn = '80' -- Visible column at 80 characters
vim.opt.mouse = '' -- Disable mouse

vim.opt.clipboard = 'unnamed'
vim.opt.spell = true
vim.opt.spelllang = 'en_us'

vim.lsp.set_log_level(4)
