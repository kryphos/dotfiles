require("edgy").setup({
    top = {
        {
            title = "Commit",
            ft = "gitcommit",
            size = { height = 0.2 },
        },
    },
    bottom = {
        {
            title = "Trouble",
            ft = "Trouble",
            open = "TroubleToggle",
            size = { height = 0.2 },
        },
        -- BUG: enabling this will crash nvim with a division by zero error on opening qf and trouble
        --{
        --title = "Quickfix",
        --ft = "qf",
        --open = "copen",
        --size = { height = 0.2 },
        --},
    },
    left = {
        {
            title = "Files",
            ft = "neo-tree",
            filter = function(buf)
                return vim.b[buf].neo_tree_source == "filesystem"
            end,
            size = { height = 0.5, width = 0.20 },
        },
        {
            title = "Git",
            ft = "fugitive",
            open = "G",
            size = { height = 0.25, width = 0.20 },
        },
        {
            title = "Symbols",
            ft = "Outline",
            open = "SymbolsOutlineOpen",
            size = { height = 0.25, width = 0.20 },
        },
    },
    right = {
        {
            title = "Spectre",
            ft = "spectre_panel",
            open = "SpectreOpen",
            size = { width = 0.35 },
        },
    },
    animate = {
        enabled = false,
    },
    close_when_all_hidden = false,
    wo = {
        winbar = false,
        winfixwidth = false,
        winfixheight = false,
        spell = false,
        signcolumn = "no",
    },
})
