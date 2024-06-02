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
    use { "Abstract-IDE/Abstract-cs" }
    use { "DanielEliasib/sweet-fusion" }
    use { "EdenEast/nightfox.nvim" }
    use { "Everblush/nvim", as = "everblush" }
    use { "Shatur/neovim-ayu" }
    use { "Sly-Harvey/radium.nvim" }
    use { "aktersnurra/no-clown-fiesta.nvim" }
    use { "bluz71/vim-moonfly-colors" }
    use { "bluz71/vim-nightfly-colors", as = "nightfly" }
    use { "bratpeki/truedark-vim" }
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "christianchiarulli/nvcode-color-schemes.vim" }
    use { "dasupradyumna/midnight.nvim" }
    use { "dgox16/oldworld.nvim" }
    use { "diegoulloao/neofusion.nvim" }
    use { "folke/tokyonight.nvim" }
    use { "kartikp10/noctis.nvim", requires = { "rktjmp/lush.nvim" } }
    use { "kepano/flexoki-neovim", as = "flexoki" }
    use { "marko-cerovac/material.nvim" }
    use { "miikanissi/modus-themes.nvim" }
    use { "nyoom-engineering/oxocarbon.nvim" }
    use { "pineapplegiant/spaceduck" }
    use { "projekt0n/github-nvim-theme" }
    use { "ray-x/starry.nvim" }
    use { "rebelot/kanagawa.nvim" }
    use { "rileytwo/kiss" }
    use { "rose-pine/neovim", as = "rose-pine" }
    use { "savq/melange-nvim" }
    use { "scottmckendry/cyberdream.nvim" }
    use { "stankovictab/mgz.nvim" }
    use { "thedenisnikulin/vim-cyberpunk" }
    use { "tiagovla/tokyodark.nvim" }
    use { "xiyaowong/transparent.nvim" }
    use { "zenbones-theme/zenbones.nvim", requires = "rktjmp/lush.nvim" }
    use { "zootedb0t/citruszest.nvim" }

    -- Icons
    use { "nvim-tree/nvim-web-devicons" }

    -- Ui tools
    use { "rcarriga/nvim-notify" }
    use {
        "sontungexpt/sttusline",
        branch = "table_version",
    }
    use { "romgrk/barbar.nvim" }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "3rd/image.nvim" },
    }
    use { "nvim-pack/nvim-spectre" }
    use { "folke/trouble.nvim" }
    use { "ziontee113/icon-picker.nvim" }
    use { "j-hui/fidget.nvim", branch = "legacy" }
    use { "stevearc/oil.nvim" }
    use { "Wansmer/symbol-usage.nvim" }
    use { "ej-shafran/compile-mode.nvim", tag = "v5.*", requires = {
        { "m00qek/baleia.nvim", tag = "v1.3.0" },
    } }
    use { "LintaoAmons/scratch.nvim" }

    -- Git
    use { "tpope/vim-fugitive" }
    use { "sindrets/diffview.nvim" }
    use { "lewis6991/gitsigns.nvim" }
    use { "github/copilot.vim" }
    use { "akinsho/git-conflict.nvim" }

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
            { "onsails/lspkind.nvim" },

            -- Snippets (actually not that big of a fan)
            { "L3MON4D3/LuaSnip" },

            -- Inlay hints
            { "jose-elias-alvarez/null-ls.nvim" },
            { "jay-babu/mason-null-ls.nvim" },
            { "lvimuser/lsp-inlayhints.nvim" },
            { "ray-x/lsp_signature.nvim" },
        }
    }

    -- Rust cargo file
    use {
        "saecki/crates.nvim",
        tag = "v0.3.0",
        requires = { "nvim-lua/plenary.nvim" },
    }

    -- Jupyther
    use { "kiyoon/jupynium.nvim", run = "pip3 install --user ." }

    -- SQL
    use { "tpope/vim-dadbod" }
    use { "kristijanhusak/vim-dadbod-completion" }
    use { "kristijanhusak/vim-dadbod-ui" }

    -- DAP
    use { "mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text" }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use { "nvim-neotest/nvim-nio" }
    use { "sakhnik/nvim-gdb" }

    -- Misc
    use { "NvChad/nvim-colorizer.lua" }
    use { "RRethy/vim-illuminate" }
    use { "TheZoq2/neovim-auto-autoread" }
    use { "chrisgrieser/nvim-early-retirement" }
    use { "dmmulroy/ts-error-translator.nvim" }
    use { "echasnovski/mini.nvim" }
    use { "folke/neodev.nvim" }
    use { "folke/todo-comments.nvim" }
    use { "ggandor/leap.nvim" }
    use { "ivanjermakov/troublesum.nvim" }
    use { "junegunn/vim-easy-align" }
    use { "klen/nvim-test" }
    use { "laytan/cloak.nvim" }
    use { "lukas-reineke/indent-blankline.nvim" }
    use { "matze/vim-move" }
    use { "mrjones2014/smart-splits.nvim" }
    use { "nacro90/numb.nvim" }
    use { "nicwest/vim-camelsnek" }
    use { "scrooloose/nerdcommenter" }
    use { "sindrets/winshift.nvim" }
    --use { "soulis-1256/eagle.nvim" }
    use { "stevearc/dressing.nvim" }
    use { "tpope/vim-repeat" }
    use { "windwp/nvim-autopairs" }
    use { "windwp/nvim-ts-autotag" }
    use { "xiyaowong/virtcolumn.nvim" }
    use { "yorickpeterse/nvim-pqf" }
    use { "zeioth/garbage-day.nvim" }
    --use { "jake-stewart/multicursor.nvim" }
end)
