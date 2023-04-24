require("nvim-dap-virtual-text").setup()
local dap, dapui = require("dap"), require("dapui")

dapui.setup({
    layouts = { {
        elements = { {
            id = "breakpoints",
            size = 0.25
        }, {
            id = "scopes",
            size = 0.50
        }, {
            id = "watches",
            size = 0.25
        } },
        position = "left",
        size = 50
    }, {
        elements = { {
            id = "repl",
            size = 1.0
        } },
        position = "bottom",
        size = 15
    } },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode",
    name = "lldb"
}

dap.configurations.c = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    },
}

dap.configurations.cpp = dap.configurations.c

dap.configurations.rust = { {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    initCommands = function()
        -- Find out where to look for the pretty printer Python module
        local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))

        local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
        local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

        local commands = {}
        local file = io.open(commands_file, "r")
        if file then
            for line in file:lines() do
                table.insert(commands, line)
            end
            file:close()
        end
        table.insert(commands, 1, script_import)

        return commands
    end,
} }
