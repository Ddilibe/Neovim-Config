-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({{
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
}, {
    'mfussenegger/nvim-lint',
    name = "nvim-lint"
}, {
    'nvim-lualine/lualine.nvim',
    name = "lualine",
    dependencies = {'nvim-tree/nvim-web-devicons'}
}, {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    keys = {{
        "<leader>?",
        function()
            require("which-key").show({
                global = false
            })
        end,
        desc = "Buffer Local Keymaps (which-key)"
    }}
}, {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate"
}, {
    'goolord/alpha-nvim',
    dependencies = {'nvim-mini/mini.icons', "nvim-lua/plenary.nvim"},
    event = "VimEnter"
}, {
    'romgrk/barbar.nvim',
    dependencies = {'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
    },
    version = '^1.0.0' -- optional: only update when a new 1.x version is released
}, {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons"}
}, {
    "lewis6991/gitsigns.nvim",
    lazy = true
}, {
    'numToStr/Comment.nvim',
    lazy = true
}, {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
}, {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    config = true,
    lazy = false
}, {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = {"nvim-tree/nvim-web-devicons"}
}, {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    }
}, {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true
}, {
    "numToStr/FTerm.nvim",
    config = true
}, {
    "https://gitlab.com/motaz-shokry/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
    config = function()
        vim.cmd("colorscheme gruvbox")
    end
}, -- lazy.nvim install example
{"zbirenbaum/copilot-cmp"}, {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"}
}, -- Completion Engine
{
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {"hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip",
                    "rafamadriz/friendly-snippets"}

}, -- Optional: LSP kind icons for completion
{
    "onsails/lspkind-nvim",
    lazy = true
}, {
    "mason-org/mason.nvim",
    opts = {}
}, {
    'saghen/blink.cmp',
    dependencies = {'rafamadriz/friendly-snippets'},
    version = '1.*'
}})
