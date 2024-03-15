require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "lua",
        "rust",
        "javascript",
        "typescript",
        "go",
        "html",
        "css",
        "php",
        "tsx",
        "vimdoc",
        "json",
    },
    indent = {
        enable = true,
    },
    highlight = {
        enable = true,
    },
})
