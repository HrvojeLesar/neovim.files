local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_cursor({}),
        },
    },
    defaults = {
        mappings = {
            n = {
                ["dq"] = actions.delete_buffer,
            },
        },
    },
})
telescope.load_extension("ui-select")

local builtin = require("telescope.builtin")
if builtin then
    vim.keymap.set("n", "<Leader>ff", function()
        builtin.find_files({ follow = true })
    end, {})
    vim.keymap.set("n", "<Leader>fg", function()
        require("custom.telescope-grep").grep()
    end, {})
    vim.keymap.set("n", "<Leader>fb", function()
        builtin.buffers()
    end, {})
    vim.keymap.set("n", "<Leader>fh", function()
        builtin.help_tags()
    end, {})
    vim.keymap.set("n", "<Leader>r", function()
        builtin.resume()
    end, {})
    vim.keymap.set("n", "<Leader>fi", function()
        builtin.current_buffer_fuzzy_find()
    end, {})
end
