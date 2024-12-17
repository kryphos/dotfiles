local installed_lsps = {
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
}

local installed_linters = {}

local installed_formatters = {
    "prettierd",
    "black",
    "isort",
    "latexindent",
    "bibtex-tidy",

    "tree-sitter-cli",
}

local lsps_with_custom_setup = {
    "clangd",
}

local installed = {}
for _, thing in ipairs(installed_lsps) do
    table.insert(installed, thing)
end
for _, thing in ipairs(installed_linters) do
    table.insert(installed, thing)
end
for _, thing in ipairs(installed_formatters) do
    table.insert(installed, thing)
end

return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            { "nvimtools/none-ls.nvim" },
            { "jay-babu/mason-null-ls.nvim" },
        },
        config = function()
            require("mason").setup()
            require("mason-null-ls").setup({
                ensure_installed = installed,
                handlers = {},
            })
            require("null-ls").setup()
        end,
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "lervag/vimtex" },

            {
                "saecki/crates.nvim",
                config = function()
                    require("crates").setup()
                end
            },

            {
                "lvimuser/lsp-inlayhints.nvim",
                config = function()
                    vim.diagnostic.config({
                        virtual_text = true
                    })

                    require("lsp-inlayhints").setup()
                end
            },

            {
                "ray-x/lsp_signature.nvim",
                opts = {
                    bind = true,
                    handler_opts = {
                        border = "rounded"
                    }
                },
                config = function(_, opts) require("lsp_signature").setup(opts) end
            },

            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },

            {
                "dmmulroy/ts-error-translator.nvim",
                config = function()
                    require("ts-error-translator").setup()
                end
            },

            {
                "ivanjermakov/troublesum.nvim",
                config = function()
                    require("troublesum").setup()
                end
            }
        },
        config = function()
            local lsp = require("lspconfig")

            lsp.clangd.setup({
                cmd = {
                    "clangd",
                    "--offset-encoding=utf-16",
                },
            })

            for _, server in ipairs(installed_lsps) do
                if not vim.tbl_contains(lsps_with_custom_setup, server) then
                    lsp[server].setup({})
                end
            end
        end,
    },

    {
        'stevearc/conform.nvim',
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    python = { "isort", "black" },
                    javascript = { "prettier" },
                    html = { "prettier" },
                    css = { "prettier" },
                    scss = { "prettier" },
                    latex = { "latexindent" },
                    bib = { "bibtex-tidy" },
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_format = "fallback",
                },
            })
        end,
    }
}
