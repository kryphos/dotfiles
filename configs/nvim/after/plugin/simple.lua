local SymbolKind = vim.lsp.protocol.SymbolKind

require("colorizer").setup()

require("crates").setup()

require("dressing").setup()

--require("eagle").setup()

require("early-retirement").setup({ retirementAgeMins = 3, })

require("fidget").setup()

require("gitsigns").setup()

require("icon-picker").setup({ disable_legacy_commands = true })

require("leap").create_default_mappings()

require("mini.ai").setup()

require("mini.surround").setup({
    mappings = {
        add = "ea",
        delete = "ed",
        replace = "er",
    }
})

require("neodev").setup()

require("notify").setup({ background_colour = "#000000", })

require("numb").setup()

require("nvim-autopairs").setup({ check_ts = true, })

require("nvim-test").setup()

require("nvim-ts-autotag").setup()

require("oil").setup()

require("pqf").setup()

require("starry").setup()

require("sttusline").setup({
    statusline_color = "#101317",
    components = {
        "mode",
        "filename",
        "git-branch",
        "%=",
        "lsps-formatters",
        "indent",
        "encoding",
        "pos-cursor",
        "pos-cursor-progress",
    },
})

require("telescope").setup({
    pickers = {
        colorscheme = { enable_preview = true }
    }
})

require("todo-comments").setup()

require("trouble").setup({ padding = false, })

require("troublesum").setup()

require("ts-error-translator").setup()

require("git-conflict").setup()

--require("symbol-usage").setup({
    --kinds = {
        --SymbolKind.Class,
        --SymbolKind.Constructor,
        --SymbolKind.Enum,
        --SymbolKind.Function,
        --SymbolKind.Interface,
        --SymbolKind.Method,
        --SymbolKind.Struct
    --},
--})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
