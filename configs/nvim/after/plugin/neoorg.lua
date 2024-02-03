require('neorg').setup({
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
            }
        }
    },
})
