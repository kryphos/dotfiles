require("mason").setup()
require("null-ls").setup()
require("mason-null-ls").setup({
    automatic_setup = true,
})
require("lsp-inlayhints").setup()
local lsp = require("lsp-zero")

lsp.preset("recommended")

-- autoformat
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_format_on_save = function(bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = augroup,
        buffer = bufnr,
        callback = function()
            -- skip formatting for certain filetypes since they dont have a formatter
            local forbidden_ft = {
                "markdown", "tex", "sh", "vim", "yaml",
                "toml", "conf", "zsh", "gitignore", "gitconfig",
                "gitcommit", "text", ""
            }
            local skip = false
            for _, ft in ipairs(forbidden_ft) do
                if vim.bo.filetype == ft then
                    skip = true
                    break
                end
            end

            -- early return didnt work
            if not skip then
                vim.lsp.buf.format()
            end
        end,
    })
end
lsp.on_attach(function(client, bufnr)
    lsp_format_on_save(bufnr)
    require("lsp-inlayhints").on_attach(client, bufnr)
    require "lsp_signature".on_attach({
        bind = true,
        handler_opts = {
            border = "rounded"
        }
    }, bufnr)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

-- Fix undefined global "vim"
require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "bufnr" },
            },
        },
    },
})

-- fix clangd offset encoding issue
require("lspconfig").clangd.setup {
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
}

-- auto install frequent language servers
require("mason-lspconfig").setup {
    ensure_installed = {
        "angularls",
        "bashls",
        "clangd",
        "cssls",
        "cssmodules_ls",
        "docker_compose_language_service",
        "dockerls",
        "emmet_language_server",
        "eslint",
        "gopls",
        "hls",
        "html",
        "htmx",
        "jsonls",
        "lua_ls",
        "ocamllsp",
        "pyright",
        "rust_analyzer",
        "sqlls",
        "tailwindcss",
        "terraformls",
        "texlab",
        "ts_ls",
        "typos_lsp",
        "taplo",
        "vimls",
        "yamlls",
    },
}
