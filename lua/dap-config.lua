local buf_set_keymap = vim.api.nvim_set_keymap
opts = { noremap = true, silent = true }

buf_set_keymap("n", "<F5>", '<cmd>lua require("dap").continue()<CR>', opts)
buf_set_keymap("n", "<F10>", '<cmd>lua require("dap").step_over()<CR>', opts)
buf_set_keymap("n", "<F11>", '<cmd>lua require("dap").step_into()<CR>', opts)
buf_set_keymap("n", "<F12>", '<cmd>lua require("dap").step_out()<CR>', opts)
buf_set_keymap("n", "<leader>b", '<cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
buf_set_keymap("n", "<leader>B", '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
    opts)
buf_set_keymap("n", "<leader>lp",
    '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts)
buf_set_keymap("n", "<leader>dr", '<cmd>lua require("dap").repl.open()<CR>', opts)
buf_set_keymap("n", "<leader>dl", '<cmd>lua require("dap").repl.run_last()<CR>', opts)
buf_set_keymap("n", "<leader>dd", '<cmd>lua local widgets=require"dap.ui.widgets"; widgets.centered_float(widgets.scopes)<CR>', opts)

buf_set_keymap("n", "<leader>dd", '<cmd>lua require("dapui").toggle()<CR>', opts)

local dap = require("dap")
local registry = require("mason-registry")

dap.adapters.delve = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. "/mason/packages/delve/dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" }
    }
}

dap.configurations.go = {
    {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}"
    },
    {
        type = "delve",
        name = "Debug test",
        request = "launch",
        mode = "test",
        program = "${file}"
    },
    {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
    }
}

dap.adapters.php = {
    type = "executable",
    command = "node",
    args = {
        vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js"
    }
}

dap.configurations.php = {
    {
        name = "Run current script",
        type = "php",
        request = "launch",
        port = 9003,
        cwd = "${fileDirname}",
        program = "${file}",
        runtimeExecutable = "php"
    },
    {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug",
        port = 9003
    }
}

dap.set_log_level("DEBUG")

dap.adapters.cppdbg = {
    type = "executable",
    command = vim.fn.stdpath("data") .. "\\cpptools\\debugAdapters\\bin\\OpenDebugAD7.exe",
    args = { "--server" },
}

dap.adapters.codelldb = function(on_adapter)
    local stdout = vim.loop.new_pipe(false)
    local stderr = vim.loop.new_pipe(false)

    local cmd = vim.fn.stdpath("data") .. "\\codelldb\\adapter\\codelldb.exe"

    local handle, pid_or_err
    local opts = {
        stdio = { nil, stdout, stderr },
        detached = true,
    }
    handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
        stdout:close()
        stderr:close()
        handle:close()
        if code ~= 0 then
            print("codelldb exited with code", code)
        end
    end)
    assert(handle, "Error running codelldb: " .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
        assert(not err, err)
        if chunk then
            local port = chunk:match("Listening on port (%d+)")
            if port then
                vim.schedule(function()
                    on_adapter({
                        type = "server",
                        host = "127.0.0.1",
                        port = port
                    })
                end)
            else
                vim.schedule(function()
                    require("dap.repl").append(chunk)
                end)
            end
        end
    end)
    stderr:read_start(function(err, chunk)
        assert(not err, err)
        if chunk then
            vim.schedule(function()
                require("dap.repl").append(chunk)
            end)
        end
    end)
end

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
    }
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require("dapui").setup()
