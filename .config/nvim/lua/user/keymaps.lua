local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n"
--   insert_mode = "i"
--   visual_mode = "v"
--   visual_block_mode = "x"
--   term_mode = "t"
--   command_mode = "c"

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>sN", "<cmd>set norelativenumber<CR>", opts)
keymap("n", "<leader>sn", "<cmd>set relativenumber<CR>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Neorg
keymap("n", "<localleader>e", ":Neorg toc right<cr>", opts)
keymap("n", "<localleader>nw", ":Neorg workspace work<cr>", opts)
keymap("n", "<localleader>np", ":Neorg workspace personal<cr>", opts)

-- Resize with arrows
keymap("n", "<C-S-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-S-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-S-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-S-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- Navigate buffers with Bufferline (plugin) controls
keymap("n", "<leader><S-l>", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<leader><S-h>", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<leader>bp", ":BufferLinePick<CR>", opts)

-- Navigate and modify tabs, splits, and buffers
keymap("n", "<leader>bd", ":bd<CR>", opts) -- close buffer
keymap("n", "<leader>bD", ":BufferLineCloseOthers<CR>", opts) -- close all other buffers
keymap("n", "<leader>bl", ":b#<CR>", opts) -- change to last edited buffer

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", "\"_dP", opts)

-- Visual Block
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

keymap("n", "<leader>tf", "<cmd>Telescope git_files<cr>", opts)
keymap("n", "<leader>tF", "<cmd>Telescope find_files<cr>", opts) -- finds all files at current working directory root. This is too much with build directories not ignored
keymap("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>tG", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<leader>ts", "<cmd>Telescope sessions<cr>", opts)
keymap("n", "<leader>tb", "<cmd>Telescope buffers<cr>", opts)

-- Enable syntax fold shortcut
keymap("n", "<leader>zz", "<cmd>:set foldmethod=syntax<cr>", opts)

-- Toggle autocomplete. Useful for text files / note taking
keymap("n", "<leader>ac", "<cmd>:lua require('cmp').setup.buffer { enabled = false }<cr>", opts)
keymap("n", "<leader>aC", "<cmd>:lua require('cmp').setup.buffer { enabled = true }<cr>", opts)

-- If using Neovide GUI, can't use terminal resize shortkey keys
if vim.g.neovide then
    vim.keymap.set({ "n", "v" }, "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
    vim.keymap.set({ "n" , "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end

-- LSP keymappings
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>f', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>zf', function()
        vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


