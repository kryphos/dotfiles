require("cloak").setup({
    enabled = true,
    cloak_character = "#",
    highlight_group = "Comment",
    patterns = {
        {
            file_pattern = {
                ".env*",
            },
            -- Match an equals sign and any character after it.
            -- This can also be a table of patterns to cloak,
            -- example: cloak_pattern = { ":.+", "-.+" } for yaml files.
            cloak_pattern = "=.+"
        },
    },
})
