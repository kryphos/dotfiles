return {
    { "LintaoAmons/scratch.nvim" },
    { "TheZoq2/neovim-auto-autoread" },
    { "junegunn/vim-easy-align" },
    { "matze/vim-move" },
    { "mrjones2014/smart-splits.nvim" },
    { "nicwest/vim-camelsnek" },
    { "scrooloose/nerdcommenter" },
    { "sindrets/winshift.nvim" },
    { "tpope/vim-repeat" },
    { "zeioth/garbage-day.nvim" },
    { "sindrets/diffview.nvim" },

    {
        "akinsho/git-conflict.nvim",
        config = true
    },

    {
        "ziontee113/icon-picker.nvim",
        config = function()
            require("icon-picker").setup({ disable_legacy_commands = true })
        end
    },

    {
        "yorickpeterse/nvim-pqf",
        config = function()
            require("pqf").setup()
        end
    },

    {
        "ggandor/leap.nvim",
        config = function()
            require("leap").create_default_mappings()
        end
    },

    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.ai").setup()

            require("mini.surround").setup({
                mappings = {
                    add = "ea",
                    delete = "ed",
                    replace = "er",
                    find = "ef",
                    find_left = "eF",
                    highlight = "eh",
                    update_n_lines = "en",
                }
            })
        end
    },

    {
        "nacro90/numb.nvim",
        config = function()
            require("numb").setup()
        end
    },

    {
        "chrisgrieser/nvim-early-retirement",
        config = function()
            require("early-retirement").setup({ retirementAgeMins = 3, })
        end
    },

    {
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup()
        end
    },

    {
        "laytan/cloak.nvim",
        config = function()
            require("cloak").setup({
                enabled = true,
                cloak_character = "#",
                highlight_group = "Comment",
                patterns = {
                    {
                        file_pattern = {
                            ".env*",
                        },
                        cloak_pattern = "=.+"
                    },
                },
            })
        end
    },
}
