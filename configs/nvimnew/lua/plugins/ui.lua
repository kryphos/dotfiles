return {
    { "nvim-tree/nvim-web-devicons" },

    {
        "Sly-Harvey/radium.nvim",
        config = function()
            vim.cmd.colorscheme "radium"
        end
    },

    {
        "sontungexpt/sttusline",
        branch = "table_version",
        config = function()
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
        end
    },

    { "romgrk/barbar.nvim" },

    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end
    },

    { "j-hui/fidget.nvim" },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    },

    {
        "xiyaowong/virtcolumn.nvim",
        config = function()
            vim.g.virtcolumn_char = "▕"
            vim.g.virtcolumn_priority = 10
        end
    },

    { "RRethy/vim-illuminate" },

    {
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup()
        end
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",
        }
    }
}
