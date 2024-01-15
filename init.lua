vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure plugins ]]
require 'lazy-plugins'

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Configure Telescope ]]
require 'telescope-setup'

-- [[ Configure Treesitter ]]
require 'treesitter-setup'

-- [[ Configure LSP ]]
require 'lsp-setup'

-- [[ Configure nvim-cmp ]]
require 'cmp-setup'
