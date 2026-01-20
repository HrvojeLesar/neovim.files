local dap = require("dap")
local dapui = require("dapui")
local widgets = require("dap.ui.widgets")

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

vim.keymap.set("n", "<leader>dw", function()
	local widgets = require("dap.ui.widgets")
	widgets.hover()
end)

vim.keymap.set("n", "<leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)

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
		type = "php",
		request = "launch",
		name = "Docker debug (/var/www/html)",
		port = 9003,
		pathMappings = {
			["/var/www/html"] = "${workspaceFolder}",
		},
	},
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

dap.adapters.nlua = function(callback, config)
	callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
end

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
		args = { "--port", "${port}" },
	},
}

local cpp_compile = require("custom.compile_debug_cmake")

dap.configurations.cpp = {
	{
		name = "Launch current file (codelldb) cwd: fileDirname",
		type = "codelldb",
		request = "launch",
		program = cpp_compile.compile_cpp_23,
		cwd = "${fileDirname}",
		stopOnEntry = false,
		runInTerminal = false,

		-- Optional: pretty-print STL with lldb
		setupCommands = {
			{
				text = "settings set target.input-fd 0",
				description = "redirect stdin",
				ignoreFailures = false,
			},
			{
				text = "settings set target.output-fd 1",
				description = "redirect stdout",
				ignoreFailures = false,
			},
		},
	},
	{
		name = "Launch current file (codelldb) cwd: workspaceFolder",
		type = "codelldb",
		request = "launch",
		program = cpp_compile.compile_cpp_23,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		runInTerminal = false,

		-- Optional: pretty-print STL with lldb
		setupCommands = {
			{
				text = "settings set target.input-fd 0",
				description = "redirect stdin",
				ignoreFailures = false,
			},
			{
				text = "settings set target.output-fd 1",
				description = "redirect stdout",
				ignoreFailures = false,
			},
		},
	},
	{
		name = "Debug binary",
		type = "codelldb",
		request = "launch",
		program = cpp_compile.select_binary,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		runInTerminal = false,

		-- Optional: pretty-print STL with lldb
		setupCommands = {
			{
				text = "settings set target.input-fd 0",
				description = "redirect stdin",
				ignoreFailures = false,
			},
			{
				text = "settings set target.output-fd 1",
				description = "redirect stdout",
				ignoreFailures = false,
			},
		},
	},
}
