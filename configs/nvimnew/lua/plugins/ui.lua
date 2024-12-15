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

    {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
        end
    },

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
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
    },

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
        },
        config = function()
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
            require("neo-tree").setup({
                close_if_last_window = true,
                popup_border_style = "rounded",
                enable_git_status = true,
                default_component_configs = {
                    git_status = {
                        symbols = {
                            -- Change type
                            added     = "+",
                            deleted   = "-",
                            modified  = "~",
                            renamed   = "→",
                            -- Status type
                            untracked = "?",
                            ignored   = "i",
                            unstaged  = "u",
                            staged    = "s",
                            conflict  = "!",
                        },
                    },
                },
                open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
                window = {
                    position = "left",
                    width = 30,
                    mapping_options = { noremap = true, nowait = true },
                    mappings = {
                        ["<space>"] = "toggle_node",
                        ["S"] = "open_split",
                        ["s"] = "open_vsplit",
                        ["C"] = "close_all_subnodes",
                        ["z"] = "expand_all_nodes",
                        ["Z"] = "close_all_nodes",
                        ["a"] = "add",
                        ["A"] = "add_directory",
                        ["d"] = "delete",
                        ["r"] = "rename",
                        ["y"] = "copy_to_clipboard",
                        ["x"] = "cut_to_clipboard",
                        ["p"] = "paste_from_clipboard",
                        ["c"] = "copy",
                        ["m"] = "move",
                        ["q"] = "close_window",
                        ["R"] = "refresh",
                        ["?"] = "show_help",
                        ["<"] = "prev_source",
                        [">"] = "next_source"
                    }
                },
                nesting_rules = {},
                filesystem = {
                    filtered_items = {
                        visible = false,
                        hide_dotfiles = true,
                        hide_gitignored = true,
                        always_show = { ".gitignore", ".env" }
                    },
                    follow_current_file = { enabled = true },
                    hijack_netrw_behavior = "open_default",
                    use_libuv_file_watcher = true,
                    window = {
                        mappings = {
                            ["<bs>"] = "navigate_up",
                            ["."] = "set_root",
                            ["H"] = "toggle_hidden",
                            ["/"] = "fuzzy_finder"
                        },
                        fuzzy_finder_mappings = {
                            ["<down>"] = "move_cursor_down",
                            ["<up>"] = "move_cursor_up"
                        }
                    }
                },
                buffers = {
                    follow_current_file = { enabled = true },
                    group_empty_dirs = true,
                    show_unloaded = true,
                    window = {
                        mappings = {
                            ["d"] = "buffer_delete",
                            ["<bs>"] = "navigate_up",
                            ["."] = "set_root"
                        }
                    }
                },
                git_status = {
                    window = {
                        position = "float",
                        mappings = {
                            ["A"] = "git_add_all",
                            ["gu"] = "git_unstage_file",
                            ["ga"] = "git_add_file",
                            ["gr"] = "git_revert_file",
                            ["gc"] = "git_commit",
                            ["gp"] = "git_push",
                            ["gg"] = "git_commit_and_push"
                        }
                    }
                }
            })
        end
    },
}
