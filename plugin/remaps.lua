vim.keymap.set("n", "<Leader>+", ":vertical resize +5<CR>", {})
vim.keymap.set("n", "<Leader>-", ":vertical resize -5<CR>", {})
vim.keymap.set("i", "<C-c>", "<Esc>", {})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {})

vim.keymap.set("n", "<Leader>y", '"+y', {})
vim.keymap.set("v", "<Leader>y", '"+y', {})

vim.keymap.set("n", "<Leader>p", '"+p', {})
vim.keymap.set("v", "<Leader>p", '"+p', {})

vim.keymap.set("n", "<Leader>w", "<C-w>n<C-w>T")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})
if vim.fn.has("win32") == 1 then
	vim.keymap.set("n", "<Leader>tt", "<Cmd>split term://powershell<CR>", {})
	vim.keymap.set("n", "<Leader>tv", "<Cmd>vertical split term://powershell<CR>", {})
else
	vim.keymap.set("n", "<Leader>tt", "<Cmd>split term://bash<CR>", {})
	vim.keymap.set("n", "<Leader>tv", "<Cmd>vertical split term://bash<CR>", {})
end

vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>")
