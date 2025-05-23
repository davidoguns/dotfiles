return {
    -- { "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
    { "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins

    { "nvim-tree/nvim-web-devicons" },

    { "hrsh7th/cmp-buffer" }, -- Autocompletion plugin
    { "hrsh7th/cmp-path" }, -- Autocompletion plugin
    { "hrsh7th/cmp-cmdline" }, -- Autocompletion plugin
    { "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp
    { "hrsh7th/cmp-nvim-lua" }, -- LSP source for nvim-cmp

    { "L3MON4D3/LuaSnip" }, -- Snippets plugin

    { "neovim/nvim-lspconfig" }, -- Collection of configurations for built-in LSP client
    -- { "jose-elias-alvarez/null-ls.nvim" }, -- for formatters and linters
    { "williamboman/mason-lspconfig.nvim" },
    { "ray-x/lsp_signature.nvim" },

    -- fancy start screen that seems to be getting overwritten by resuming last open files
    -- or session. Is this new default neovim or another plugin's behavior?
    { "mhinz/vim-startify" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "nvim-treesitter/nvim-treesitter-context" },

    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" }
    },

    {
      'MeanderingProgrammer/render-markdown.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you use the mini.nvim suite
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        opts = {},
    },
    { "nvim-neorg/neorg",
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        config = true,
    },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        config = true,
    },
}
