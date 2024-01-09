local dap = require("dap")
local dapui = require("dapui")

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<F5>", dap.continue, opts)
vim.keymap.set("n", "<F10>", dap.step_over, opts)
vim.keymap.set("n", "<F11>", dap.step_into, opts)
vim.keymap.set("n", "<F12>", dap.step_out, opts)
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, opts)
vim.keymap.set("n", "<leader>B", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, opts)
vim.keymap.set("n", "<leader>lp", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, opts)
vim.keymap.set("n", "<leader>dr", dap.repl.open, opts)
vim.keymap.set("n", "<leader>dl", dap.run_last, opts)

-- vim.keymap.set("n", "<leader>dd", local widgets=require"dap.ui.widgets"; widgets.centered_float(widgets.scopes), opts)
vim.keymap.set("n", "<leader>dd", dapui.toggle, opts)

vim.keymap.set({ "n", "v" }, "<leader>K", dapui.eval, opts)
vim.keymap.set({ "n", "v" }, "<leader>k", function()
	dapui.float_element("scopes", { enter = true })
end, opts)

dap.adapters.delve = {
	type = "server",
	port = "${port}",
	executable = {
		command = vim.fn.stdpath("data") .. "/mason/packages/delve/dlv",
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
}

dap.configurations.go = {
	{
		type = "delve",
		name = "Debug",
		request = "launch",
		program = "${file}",
	},
	{
		type = "delve",
		name = "Debug test",
		request = "launch",
		mode = "test",
		program = "${file}",
	},
	{
		type = "delve",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}",
	},
}

dap.adapters.php = {
	type = "executable",
	command = "node",
	args = {
		vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js",
	},
}

dap.configurations.php = {
	{
		name = "Run current script",
		type = "php",
		request = "launch",
		port = 9003,
		cwd = "${fileDirname}",
		program = "${file}",
		runtimeExecutable = "php",
	},
	{
		type = "php",
		request = "launch",
		name = "Listen for Xdebug",
		port = 9003,
	},
}

dap.configurations.cpp = {
	{
		name = "Debug",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\", "file")
		end,
		cwd = "${workspaceFolder}",
		MIMode = "gdb",
		miDebuggerPath = "D:\\MinGW\\mingw32\\bin\\gdb.exe",
	},
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
