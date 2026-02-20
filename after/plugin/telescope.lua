local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_cursor({}),
        },
        smart_history = {}
    },
    defaults = {
        history = {
            path = vim.fn.stdpath("data") .. "/databases/telescope_history.sqlite3",
            limit = 100,
        },
        mappings = {
            n = {
                ["dq"] = actions.delete_buffer,
            },
            i = {
                -- Another example using Ctrl-j and Ctrl-k
                ["<C-j>"] = actions.cycle_history_prev,
                ["<C-k>"] = actions.cycle_history_next
            },
        },
    },
})

telescope.load_extension("ui-select")
telescope.load_extension('smart_history')

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
    vim.keymap.set("n", "<Leader>th", function()
        require("custom.telescope-search-history").search_history_picker()
    end, {})
end
