require("nvim-tree").setup({
    view = {
        mappings = {
            list = {
                {
                    key = "<C-c>", action = "cd"
                }
            }
        }
    }
})

vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>n", ":NvimTreeFindFile<CR>", {})
