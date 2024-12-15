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
                pickers = {
                    find_files = { theme = "ivy" },
                },
                extensions = {
                    fzf = {},
                }
            })

            require("telescope").load_extension("fzf")
        end
    },
}
