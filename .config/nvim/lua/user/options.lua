-- :help options to see all options
vim.opt.backup = false;
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "preview" }  -- auto complete menu has preview and default selection
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.mouse = "a"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showtabline = 4                      -- always show top line showing open neovim tabs
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.wrap = false
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.background = "dark"
vim.opt.termguicolors = true                 -- enaables fancier font rendering and better colors
vim.opt.updatetime = 1000                    -- updates to show symbol highlight faster, default = 5000
