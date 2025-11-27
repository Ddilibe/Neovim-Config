-- Custom Configurations for nvim tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Optional enable 24-bit colour
vim.opt.termguicolors = false

vim.g.nvim_tree_respect_buf_cwd = 1

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true
        }
    end

    api.config.mappings.default_on_attach(bnfnr)

    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

-- Editting the size of the arrows on the tree
-- vim.api.nvim_t(0, "NvimTreeFolderArrow", {
--     fg = "#999999",
--     style = "bold"
-- })

-- empty setup using defaults
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive"
    },
    renderer = {
        icons = {
            show = {
                file = false,
                folder = false,
                folder_arrow = true,
                git = true
            },
            glyphs = {
                folder = {
                    arrow_closed = "➤",
                    arrow_open = "↳",
                    default = "➤",
                    open = "↳"
                },
                -- highlight = "NvimTreeFolderArrow"
            }
        }
    },
    view = {
        width = 25,
        side = 'left'
    },
    sync_root_with_cwd = true, -- fix to open cwd with tree
    respect_buf_cwd = true,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
        update_root = true
    },
    filters = {
        dotfiles = true
    },
    on_attach = my_on_attach
})

