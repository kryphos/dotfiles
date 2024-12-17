local ignore_filetypes_list = {
    "%.xlsx", "%.jpg", "%.png", "%.webp", "%.pdf", "%.odt", "%.ico",
}

return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        config = function()
            require("harpoon"):setup()
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
            }
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = ignore_filetypes_list,
                },
                pickers = {
                    find_files = { theme = "ivy" },
                    live_grep = { theme = "ivy" },
                    grep_string = { theme = "ivy" },
                },
                extensions = {
                    fzf = {},
                }
            })

            require("telescope").load_extension("fzf")
        end
    },
}
