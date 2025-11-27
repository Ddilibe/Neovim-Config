require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = {
        light = "latte",
        dark = "macchiato"
    },
    transparent_background = true,
    float = {
        transparent = true,
        solid = true,
    },
    show_end_of_buffer = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.5
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = {
        comments = {"italic"}, -- Change the style of comments
        conditionals = {"italic"},
        loops = {},
        functions = {},
        keywords = {"bold"},
        strings = {},
        variables = {},
        numbers = {"bold"},
        booleans = {},
        properties = {},
        types = {},
        operators = {}
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    lsp_styles = { 
        virtual_text = {
            errors = {"italic"},
            hints = {"italic"},
            warnings = {"italic"},
            information = {"italic"},
            ok = {"italic"}
        },
        underlines = {
            errors = {"underline"},
            hints = {"underline"},
            warnings = {"underline"},
            information = {"underline"},
            ok = {"underline"}
        },
        inlay_hints = {
            background = true
        }
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    auto_integrations = false,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = ""
        }
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    }
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
