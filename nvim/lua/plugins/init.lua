return {
    { "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
    { "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins

    { "kyazdani42/nvim-web-devicons" },

    { "lukas-reineke/indent-blankline.nvim" },

    { "hrsh7th/cmp-buffer" }, -- Autocompletion plugin
    { "hrsh7th/cmp-path" }, -- Autocompletion plugin
    { "hrsh7th/cmp-cmdline" }, -- Autocompletion plugin
    { "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp
    { "hrsh7th/cmp-nvim-lua" }, -- LSP source for nvim-cmp

    { "L3MON4D3/LuaSnip" }, -- Snippets plugin

    { "neovim/nvim-lspconfig" }, -- Collection of configurations for built-in LSP client
    { "williamboman/nvim-lsp-installer" },
    { "jose-elias-alvarez/null-ls.nvim" }, -- for formatters and linters

    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-media-files.nvim" },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    { "Shatur/neovim-session-manager" },

    -- fancy start screen that seems to be getting overwritten by resuming last open files
    -- or session. Is this new default neovim or another plugin's behavior?
    { "mhinz/vim-startify" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },

    { "ggandor/lightspeed.nvim" },

    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap"}
    },
}
