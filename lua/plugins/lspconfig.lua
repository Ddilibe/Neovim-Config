-- Install plugins via lazy.nvim or packer:
-- nvim-lspconfig, nvim-cmp, cmp-nvim-lsp, LuaSnip
local cmp = require("cmp")
local lspconfig = vim.lsp.config
local luasnip = require("luasnip")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Load friendly snippets
require("luasnip.loaders.from_vscode").lazy_load()
require("mason").setup({
    ensure_installed = {"pyright", -- For Pyright
    "python-lsp-server" -- For Pylsp
    }
})

-- nvim-cmp setup
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            select = true
        }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item()
    }),
    sources = cmp.config.sources({{
        name = "nvim_lsp"
    }, {
        name = "luasnip"
    }, {
        name = "buffer"
    }, {
        name = "path"
    }}),
    formatting = {
        format = require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 50
        })
    }
})

-- Example: Lua LSP
-- lspconfig.lua_ls.setup({
--     capabilities = require("cmp_nvim_lsp").default_capabilities()
-- })

-- -- Example: Python
-- lspconfig.pyright.setup({
--     capabilities = capabilities
-- })

-- -- Example: Lua (nvim configuration)
-- lspconfig.lua_ls.setup({
--     capabilities = capabilities
-- })

-- -- Add other LSPs as needed
-- lspconfig.tsserver.setup({
--     capabilities = capabilities
-- })
-- lspconfig.rust_analyzer.setup({
--     capabilities = capabilities
-- })
-- lspconfig.gopls.setup({
--     capabilities = capabilities
-- })
-- lspconfig.html.setup({
--     capabilities = capabilities
-- })
-- lspconfig.cssls.setup({
--     capabilities = capabilities
-- })
-- lspconfig.bashls.setup({
--     capabilities = capabilities
-- })
-- lspconfig.jsonls.setup({
--     capabilities = capabilities
-- })
-- lspconfig.yamlls.setup({
--     capabilities = capabilities
-- })
-- lspconfig.dockerls.setup({
--     capabilities = capabilities
-- })
-- lspconfig.ts_ls.setup({
--     capabilities = capabilities
-- })
