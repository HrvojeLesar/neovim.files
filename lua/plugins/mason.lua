return {
    {
        "meson-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "meson-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                automatic_enable = false,
            })
        end,
    },
}
