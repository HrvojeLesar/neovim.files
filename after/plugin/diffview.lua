local diff_view = require("diffview")

if diff_view then
    vim.keymap.set("n", "<F3>", ":DiffviewOpen<CR>", {})
    vim.keymap.set("n", "<F4>", ":DiffviewClose<CR>", {})
end
