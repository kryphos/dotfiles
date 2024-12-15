require("nvim-dap-virtual-text").setup()
local dap, dapui = require("dap"), require("dapui")

dapui.setup({
    layouts = { {
        elements = {
            {
                id = "scopes",
                size = 0.50
            },
            {
                id = "watches",
                size = 0.25
            },
            {
                id = "breakpoints",
                size = 0.25
            },
        },
        position = "left",
        size = 50
    }, {
        elements = {
            {
                id = "repl",
                size = 1.0
            }
        },
        position = "bottom",
        size = 8
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

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = "/usr/bin/codelldb",
        args = { "--port", "${port}" },
    }
}

dap.configurations.c = {
    {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}

dap.configurations.cpp = dap.configurations.c

dap.configurations.rust = { {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
} }
