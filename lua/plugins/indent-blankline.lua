return {
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "CustomBlanklineIndentChar", { fg = "#31353f" })
            end)

            require("ibl").setup({
                indent = {
                    char = "│",
                    highlight = "CustomBlanklineIndentChar",
                },
                scope = { enabled = false },
            })
        end,
    },

}
