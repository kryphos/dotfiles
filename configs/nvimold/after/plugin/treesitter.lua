require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query", "cpp", "rust", "javascript",
        "typescript", "java", "ocaml", "python", "html", "css", "scss", "haskell",
        "json", "yaml", "toml", "dockerfile", "bash", "cmake", "make"
    },
    sync_install = false,
    auto_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
