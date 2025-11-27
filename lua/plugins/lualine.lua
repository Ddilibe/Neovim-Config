require("lualine").setup({
    options = {
        theme = "auto",
        globalstatus = true,
        icons_enabled = true,
        component_separators = {
            left = "",
            right = ""
        },
        section_separators = {
            left = "",
            right = ""
        },
        disabled_filetypes = {"alpha", "NvimTree", "TelescopePrompt"}
    },

    sections = {
        lualine_a = {{
            "mode",
            icon = ""
        }},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {{
            "filename",
            file_status = true,
            newfile_status = true,
            path = 1
        }},
        lualine_x = {{
            "filetype",
            icon_only = false
        }, "encoding", "fileformat"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
    }
})
