vim.g.mapleader = " "

-- <C-*> for rescaling if using neovide
if vim.g.neovide == true then
    vim.api.nvim_set_keymap("n", "<C-+>",
        ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.05<CR> :lua vim.g.neovide_padding_bottom = 0<CR>",
        { silent = true })
    vim.api.nvim_set_keymap("n", "<C-->",
        ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.05<CR> :lua vim.g.neovide_padding_bottom = 0<CR>",
        { silent = true })
    vim.api.nvim_set_keymap("n", "<C-0>",
        ":lua vim.g.neovide_scale_factor = 0.65<CR>",
        { silent = true })
end

-- ctrl + s for saving
vim.keymap.set("n", "<C-s>", ":w<CR>")

-- esc for leaving insert mode in terminal
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])

-- close everything on :Q
vim.cmd([[command! Q :wqa!]])

-- make jump commands also center the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- quickfix/trouble list navigation
vim.keymap.set("n", "<C-n>", ":cnext<CR>")
vim.keymap.set("n", "<C-S-n>", ":cprev<CR>")
vim.keymap.set("n", "<C-t>", ":lua require('trouble').next({ skip_groups = true, jump = true })<CR>")
vim.keymap.set("n", "<C-S-t>", ":lua require('trouble').previous({ skip_groups = true, jump = true })<CR>")

-- tab navigation + terminal
vim.keymap.set("n", "<M-t>", ":terminal <CR>")
vim.keymap.set("n", "<M-x>", ":tabclose <CR>")
vim.keymap.set("n", "<M-c>", ":tabnew <CR>")
vim.keymap.set("n", "<M-1>", ":tabn 1<CR>")
vim.keymap.set("n", "<M-2>", ":tabn 2<CR>")
vim.keymap.set("n", "<M-3>", ":tabn 3<CR>")
vim.keymap.set("n", "<M-4>", ":tabn 4<CR>")
vim.keymap.set("n", "<M-5>", ":tabn 5<CR>")

-- resize splits
vim.keymap.set("n", "<C-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").resize_right)
vim.keymap.set("n", "<leader>w", ":WinShift<CR>")

-- popouts
vim.keymap.set("n", "<leader>e", ":Neotree toggle left<CR>")
vim.keymap.set("n", "<leader>g", ":G<CR>")
vim.keymap.set("n", "<leader>o", ":SymbolsOutline<CR>")
vim.keymap.set("n", "<leader>s", "<cmd>lua require('spectre').toggle()<CR>", {})
vim.keymap.set("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", {})
vim.keymap.set("n", "<leader>t", ":TroubleToggle workspace_diagnostics<CR>")

-- harpoon
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", require("harpoon.mark").add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)

-- telescope and lsp
local telescope = require("telescope.builtin")
local opts = { buffer = bufnr, remap = false }
vim.keymap.set("n", "<leader>ff", telescope.find_files, {})
vim.keymap.set("n", "<leader>fw", telescope.live_grep, {})
vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
vim.keymap.set("n", "<leader>f*", telescope.grep_string, {})
vim.keymap.set("n", "<leader>le", telescope.diagnostics, {})
vim.keymap.set("n", "<leader>lf", telescope.lsp_references, {})
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>li", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>lo", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

-- debugging
vim.keymap.set("n", "<leader>dt", ":lua require('dapui').toggle()<CR>")
vim.keymap.set("n", "<leader>b", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<leader>B", ":lua require('dap').set_breakpoint(vim.fn.input('Condition: '))<CR>")
vim.keymap.set("n", "<F5>", ":DapContinue<CR>")
vim.keymap.set("n", "<F10>", ":DapStepOver<CR>")
vim.keymap.set("n", "<F11>", ":DapStepInto<CR>")
vim.keymap.set("n", "<F12>", ":DapStepOut<CR>")
