require("nvim-autopairs").setup({
    check_ts = true,
})

require("nvim-ts-autotag").setup()

require("crates").setup()

require("dressing").setup()

require("early-retirement").setup({
    retirementAgeMins = 3,
})

require("fidget").setup()

require("gitsigns").setup()

require("leap").create_default_mappings()

require("lualine").setup({
    options = {
        theme = "ayu",
    },
})

require("luatab").setup()

require("nvim-test").setup()

require("neodev").setup()

require("todo-comments").setup()

require("trouble").setup({
    padding = false,
})

require("overlength").setup({
    default_overlength = 100,
})

require("icon-picker").setup({
    disable_legacy_commands = true
})

require("hypersonic").setup()

require("troublesum").setup()

require("pqf").setup()

require("numb").setup()

require("colorizer").setup()

require("mini.ai").setup()

require("mini.surround").setup({
    mappings = {
        add = "ea",
        delete = "ed",
        replace = "er",
    }
})

require("ts-error-translator").setup()

require('alpha').setup(require('alpha.themes.dashboard').config)

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
