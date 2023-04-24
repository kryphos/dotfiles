vim.opt.fillchars = { eob = " " }
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.showtabline = 2
vim.opt.cursorline = true
vim.opt.colorcolumn = "100"
vim.g.virtcolumn_char = "▕"
vim.g.virtcolumn_priority = 10

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.cmdheight = 0

vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 3
vim.opt.splitkeep = "screen"

vim.o.shell = "zsh"
vim.o.timeout = true
vim.o.timeoutlen = 400

vim.o.guifont = "Terminus (TTF):h22"
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_scale_factor = 0.85
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_transparency = 0.95

vim.cmd("colorscheme midnight")
