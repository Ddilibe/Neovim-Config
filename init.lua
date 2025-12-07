-- Configurations for Neovim
-- Basic Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 500
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.guifont = "monospace:h14"

-- Setup Configurations
require("config.mangino")
require("config.theme")
require("config.options")
require("config.mappings")
require("config.autocmd")

-- Pluggin Configurations
require("plugins.lazy")
require("plugins.autopairs")
require("plugins.gitsigns")
require("plugins.comments")
require("plugins.fterm")
require("plugins.fzf")
require("plugins.nvim-tree")
require("plugins.treesitter")
require("plugins.linting")
require("plugins.lualine")
require("plugins.alpha")
require("plugins.gruvbox")
require("plugins.colorizer")
require("plugins.lspconfig")
require("plugins.catppuccin")
require("plugins.blink")

-- print("Neovim Configurations")

-- most of this configuration is sourced from various online tutorials and adapted to my liking. 
-- One of the main sources is the "Neovim from Scratch" series by "ThePrimeagen" on YouTube and "neovim config from scratch: structure, plugins, etc" by "bread on penguins"
-- credit to them for the bulk of the work!
-- additionally, some configurations are adapted from my previous vimrc setups.
-- happy coding!
-- Mangino Neovim Configurations
-- June 2024
