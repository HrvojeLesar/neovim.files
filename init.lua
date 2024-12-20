vim.g.mapleader = ";"
vim.g.ftplugin_sql_omni_key = "<Leader>sql"

-- Windows doesn't support SIGTSTP
if vim.fn.has("win32") == 1 then
    vim.keymap.set("n", "<C-z>", "<Nop>", {})
    vim.opt.undodir = os.getenv("UserProfile") .. "/.nvim/undodir"
else
    vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
end

-- stop vscode extension to try and start neovim plugins
if vim.g.vscode then
    return
end

require("config.lazy")
