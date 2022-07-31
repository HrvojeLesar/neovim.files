vim.g.mapleader = ";"
vim.g.ftplugin_sql_omni_key = "<Leader>sql"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.pumheight = 13
vim.opt.syntax = "on"

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
})

-- Windows doesn't support SIGTSTP
if vim.fn.has("win32") == 1 then
    vim.keymap.set("n", "<C-z>", "<Nop>", {})
    vim.opt.undodir = os.getenv("UserProfile") .. "/.nvim/undodir"
else
    vim.opt.undodir = "~/.nvim/undodir"
end

-- stop vscode extension to try and start neovim plugins
if vim.g.vscode then
    return
end

require("remaps")
require("plugins")
