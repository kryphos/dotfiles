local lspkind = require('lspkind')
local cmp = require("cmp")

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
            show_labelDetails = true,
        })
    }
})

cmp.setup.filetype({ "sql" }, {
    sources = {
        { name = "buffer" },
        { name = "vim-dadbod-completion" },
    }
})

require("tailwindcss-colorizer-cmp").setup({
    color_square_width = 2,
})
