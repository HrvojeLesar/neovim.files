return {
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<F2>", ":UndotreeToggle<CR>", {})
        end,
    },
}
