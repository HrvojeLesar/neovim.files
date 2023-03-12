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

local function open_nvim_tree(data)

    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if directory then
        -- change to the directory
        vim.cmd.cd(data.file)
        -- open the tree
        require("nvim-tree.api").tree.open()
    end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

