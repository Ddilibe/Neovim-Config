local lint = require("lint")

-- Linters by filetype
lint.linters_by_ft = {
    lua = {"luacheck"},
    python = {"flake8"},
    javascript = {"eslint_d"},
    typescript = {"eslint_d"},
    html = {"htmllint"},
    css = {"stylelint"},
    go = {"golangci_lint"},
    rust = {"clippy"},
    yaml = {"yamllint"},
    markdown = {"markdownlint"},
    sh = {"shellcheck"}
}

-- Custom linter configs
lint.linters.eslint_d = {
    cmd = "eslint_d",
    args = {"-f", "json", "--stdin", "--stdin-filename", function()
        return vim.api.nvim_buf_get_name(0)
    end},
    stdin = true
}

lint.linters.flake8 = {
    cmd = "flake8",
    args = {"--format=%(row)d:%(col)d:%(code)s:%(text)s", "-"},
    stdin = true
}

-- Autocommands for linting events
local group = vim.api.nvim_create_augroup("nvim_lint", {
    clear = true
})

vim.api.nvim_create_autocmd({"BufReadPost", "BufWritePost", "InsertLeave"}, {
    group = group,
    callback = function()
        lint.try_lint()
    end
})
