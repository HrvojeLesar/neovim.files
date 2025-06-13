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

vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>")

vim.keymap.set("n", "<Leader>t", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)
