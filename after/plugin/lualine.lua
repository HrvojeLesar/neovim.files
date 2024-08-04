local function codeium_status()
    return vim.api.nvim_call_function("codeium#GetStatusString", {})
end

require("lualine").setup({
    options = {
        theme = "auto",
        component_separators = "",
        section_separators = "",
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diagnostics" },
        lualine_c = {
            {
                "filetype",
                colored = true,
                icon_only = true,
                icon = {
                    align = "right",
                },
                padding = { left = 1, right = 1 },
            },
            {
                "filename",
                padding = { left = 0 },
            },
        },
        lualine_x = { codeium_status },
        lualine_y = { "location" },
        lualine_z = { "progress" },
    },
})
