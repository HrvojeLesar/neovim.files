local buf_set_keymap = vim.api.nvim_set_keymap
opts = { noremap=true, silent=true }

buf_set_keymap('n', '<F5>', '<cmd>lua require"dap".continue()<CR>', opts) 
buf_set_keymap('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>', opts) 
buf_set_keymap('n', '<F11>', '<cmd>lua require"dap".step_into()<CR>', opts) 
buf_set_keymap('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>', opts) 
buf_set_keymap('n', '<leader>b', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts) 
buf_set_keymap('n', '<leader>B', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts) 
buf_set_keymap('n', '<leader>lp', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts) 
buf_set_keymap('n', '<leader>dr', '<cmd>lua require"dap".repl.open()<CR>', opts) 
buf_set_keymap('n', '<leader>dl', '<cmd>lua require"dap".repl.run_last()<CR>', opts)
--buf_set_keymap('n', '<leader>dd', '<cmd>lua local widgets=require"dap.ui.widgets"; widgets.centered_float(widgets.scopes)<CR>', opts) 

buf_set_keymap('n', '<leader>dd', '<cmd>lua require("dapui").toggle()<CR>', opts) 

local dap = require('dap')

--dap.adapters.go = {
--	type = "server",
--	host = "127.0.0.1",
--	port = 38697,
--}

dap.adapters.go = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
      stdio = {nil, stdout},
      args = {"dap", "-l", "127.0.0.1:" .. port},
      detached = false
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then
        print('dlv exited with code', code)
      end
    end)
    assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then
        vim.schedule(function()
          require('dap.repl').append(chunk)
        end)
      end
    end)
    -- Wait for delve to start
    vim.defer_fn(
      function()
        callback({type = "server", host = "127.0.0.1", port = port})
      end,
      1000)
  end

dap.configurations.go = {
	{
		type = "go",
		name = "Debug",
		request = "launch",
		program = "${file}"
	},
	{
		type = "go",
		name = "Debug test", -- configuration for debugging test files
		request = "launch",
		mode = "test",
		program = "${file}"
	},
	-- works with go.mod packages and sub packages 
	{
		type = "go",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}"
	} 
}

require("dapui").setup()

--[[
dap.adapters.go = function(callback, config)
	local stdout = vim.loop.new_pipe(false)
	local handle
	local pid_or_err
	local port = 38697
	local opts = {
		stdio = {nil, stdout},
		args = {"dap", "-l", "127.0.0.1:" .. port},
		detached = true
	}
	handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
		stdout:close()
		handle:close()
		if code ~= 0 then
			print('dlv exited with code', code)
		end
	end)
	assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
	stdout:read_start(function(err, chunk)
		assert(not err, err)
		if chunk then
			vim.schedule(function()
				require('dap.repl').append(chunk)
			end)
		end
	end)
	-- Wait for delve to start
	vim.defer_fn(
	function()
		callback({type = "server", host = "127.0.0.1", port = port})
	end,
	100)
end
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
	{
		type = "go",
		name = "Debug",
		request = "launch",
		program = "${file}"
	},
	{
		type = "go",
		name = "Debug test", -- configuration for debugging test files
		request = "launch",
		mode = "test",
		program = "${file}"
	},
	-- works with go.mod packages and sub packages 
	{
		type = "go",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}"
	} 
}
--]]
