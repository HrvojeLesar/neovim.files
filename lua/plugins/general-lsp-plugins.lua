return {
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup({
                hint_prefix = "",
            })
        end,
    },

    -- Extremly slow for large files (might be because of treesitter)
    { "RRethy/vim-illuminate" },
}
