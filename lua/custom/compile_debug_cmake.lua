local M = {}

M.compile_cpp_23 = function()
	local extra_flags = ""
	vim.ui.input({
		prompt = "Extra clang++ flags: ",
	}, function(input)
		if input ~= nil then
			extra_flags = input
		end
	end)

	-- Compile the current file with clang++ and debug symbols
	local filename = vim.fn.expand("%:p:r") -- full path without extension
	local source = vim.fn.expand("%:p")
	local binary = filename

	-- You can tweak flags here (C++20, warnings, etc.)
	local compile_cmd = string.format(
		"clang++ -std=c++23 -g -O0 %s -o %s %s",
		extra_flags,
		vim.fn.shellescape(binary),
		vim.fn.shellescape(source)
	)

	print("Compiling: " .. compile_cmd)
	os.execute(compile_cmd)

	if vim.v.shell_error ~= 0 then
		vim.notify("Compilation failed!", vim.log.levels.ERROR)
		return nil
	end

	return binary
end

M.select_binary = function()
	local find_command = {
		"find",
		"build",
		"-name",
		"CMakeFiles",
		"-prune",
		"-o",
		"-type",
		"f",
		"-executable",
		"-print",
	}

	local command_result = vim.system(find_command, { text = true }):wait().stdout or ""
	local executables = vim.split(command_result, "\n")

	local formated_executables = {}
	for i, exe in ipairs(executables) do
		table.insert(formated_executables, i .. ". " .. exe)
	end

	local selection = vim.fn.inputlist(formated_executables)

	local selected_binary = executables[selection]

	return selected_binary
end

return M
