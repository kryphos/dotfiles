-- Install Packer if it's not already installed
local packer_install_path = vim.fn.stdpath("data") ..
    "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
    vim.fn.system({
        "git", "clone", "--depth=1",
        "https://github.com/wbthomason/packer.nvim", packer_install_path
    })
    vim.cmd("packadd packer.nvim")
end

return require("packer").startup(function(use)
    -- Packer can manage itself
    use { "wbthomason/packer.nvim" }

    -- Themes
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "nyoom-engineering/oxocarbon.nvim" }
    use { "stankovictab/mgz.nvim" }
    use { "EdenEast/nightfox.nvim" }
    use { "rebelot/kanagawa.nvim" }
    use { "Shatur/neovim-ayu" }
    use { "pineapplegiant/spaceduck" }
    use { "thedenisnikulin/vim-cyberpunk" }
    use { "rose-pine/neovim", as = "rose-pine" }
    use { "projekt0n/github-nvim-theme" }
    use { "folke/tokyonight.nvim" }
    use { "marko-cerovac/material.nvim" }
    use { "bluz71/vim-nightfly-colors", as = "nightfly" }
    use { "christianchiarulli/nvcode-color-schemes.vim" }
    use { "dasupradyumna/midnight.nvim" }

    -- Icons
    use { "nvim-tree/nvim-web-devicons" }

    -- Ui tools
    use { "folke/edgy.nvim" }
    use { "nvim-lualine/lualine.nvim" }
    use { "alvarosevilla95/luatab.nvim" }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    }
    use { "nvim-pack/nvim-spectre" }
    use { "folke/trouble.nvim" }
    use { "ziontee113/icon-picker.nvim" }
    use { "tomiis4/Hypersonic.nvim" }
    use { "j-hui/fidget.nvim", branch = "legacy" }
    use { "simrat39/symbols-outline.nvim" }

    -- Git
    use { "tpope/vim-fugitive" }
    use { "sindrets/diffview.nvim" }
    use { "lewis6991/gitsigns.nvim" }
    use { "github/copilot.vim" }

    -- telescope + harpoon
    use {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = { "nvim-lua/plenary.nvim" }
    }
    use { "ThePrimeagen/harpoon" }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use { "nvim-treesitter/nvim-treesitter-context" }

    -- LSP
    use { "lervag/vimtex" }
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim",               run = ":MasonUpdate" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "roobert/tailwindcss-colorizer-cmp.nvim" },

            -- Snippets (actually not that big of a fan)
            { "L3MON4D3/LuaSnip" },

            -- Inlay hints
            { "jose-elias-alvarez/null-ls.nvim" },
            { "jay-babu/mason-null-ls.nvim" },
            { "lvimuser/lsp-inlayhints.nvim" },
            { "ray-x/lsp_signature.nvim" },
        }
    }

    -- neoorg
    use {
        "nvim-neorg/neorg",
        run = ":Neorg sync-parsers",
    }

    -- Rust cargo file
    use {
        "saecki/crates.nvim",
        tag = "v0.3.0",
        requires = { "nvim-lua/plenary.nvim" },
    }

    -- DAP
    use { "mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text" }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    -- Misc
    use { "echasnovski/mini.nvim" }
    use { "stevearc/dressing.nvim" }
    use { "mrjones2014/smart-splits.nvim" }
    use { "sindrets/winshift.nvim" }
    use { "yorickpeterse/nvim-pqf" }
    use { "nacro90/numb.nvim" }
    use { "matze/vim-move" }
    use { "windwp/nvim-autopairs" }
    use { "lukas-reineke/indent-blankline.nvim" }
    use { "laytan/cloak.nvim" }
    use { "scrooloose/nerdcommenter" }
    use { "RRethy/vim-illuminate" }
    use { "windwp/nvim-ts-autotag" }
    use { "nicwest/vim-camelsnek" }
    use { "lcheylus/overlength.nvim" }
    use { "klen/nvim-test" }
    use { "folke/todo-comments.nvim" }
    use { "chrisgrieser/nvim-early-retirement" }
    use { "TheZoq2/neovim-auto-autoread" }
    use { "folke/neodev.nvim" }
    use { "ggandor/leap.nvim" }
    use { "tpope/vim-repeat" }
    use { "xiyaowong/virtcolumn.nvim" }
    use { "ivanjermakov/troublesum.nvim" }
    use { "junegunn/vim-easy-align" }
    use { "NvChad/nvim-colorizer.lua" }
end)
