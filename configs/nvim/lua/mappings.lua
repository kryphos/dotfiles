-- ctrl + s for saving
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")

-- m for running the compile command
vim.keymap.set("n", "m", "<cmd>belowright Compile<CR>")

-- esc for leaving insert mode in terminal
vim.keymap.set("t", "<C-e>", [[<C-\><C-n>]])

-- make jump commands also center the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- quickfix/trouble list navigation
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-S-n>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<C-t>", "<cmd>lua require('trouble').next({ skip_groups = true, jump = true })<CR>")
vim.keymap.set("n", "<C-S-t>", "<cmd>lua require('trouble').prev({ skip_groups = true, jump = true })<CR>")

-- tab navigation + terminal
vim.keymap.set("n", "<M-t>", "<cmd>terminal <CR>")
vim.keymap.set("n", "<M-x>", "<cmd>tabclose <CR>")
vim.keymap.set("n", "<M-c>", "<cmd>tabnew <CR>")
vim.keymap.set("n", "<M-1>", "<cmd>tabn 1<CR>")
vim.keymap.set("n", "<M-2>", "<cmd>tabn 2<CR>")
vim.keymap.set("n", "<M-3>", "<cmd>tabn 3<CR>")
vim.keymap.set("n", "<M-4>", "<cmd>tabn 4<CR>")
vim.keymap.set("n", "<M-5>", "<cmd>tabn 5<CR>")

-- resize splits
vim.keymap.set("n", "<C-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").resize_right)
vim.keymap.set("n", "<leader>w", "<cmd>WinShift<CR>")

-- popouts
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle left<CR>")
vim.keymap.set("n", "<leader>g", "<cmd>G<CR>")
vim.keymap.set("n", "<leader>s", "<cmd>lua require('spectre').toggle()<CR>", {})
vim.keymap.set("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", {})
vim.keymap.set("n", "<leader>t", "<cmd>Trouble diagnostics<CR>")
vim.keymap.set("n", "<leader>o", "<cmd>Oil . --float <CR>")

-- harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)

-- telescope and lsp
local telescope = require("telescope.builtin")
local opts = { buffer = bufnr, remap = false }
vim.keymap.set("n", "<leader>fc", function()
    telescope.find_files({
        cwd = "~/.dotfiles/",
    })
end, {})
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
