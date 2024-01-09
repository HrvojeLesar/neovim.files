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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {})

-- require("remaps")
-- require("plugins")
-- require("autocmds")
