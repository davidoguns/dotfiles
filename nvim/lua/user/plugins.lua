local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  use "kyazdani42/nvim-web-devicons"
  use "folke/tokyonight.nvim"

  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "lukas-reineke/indent-blankline.nvim"

  use "hrsh7th/nvim-cmp" -- Autocompletion plugin
  use "hrsh7th/cmp-buffer" -- Autocompletion plugin
  use "hrsh7th/cmp-path" -- Autocompletion plugin
  use "hrsh7th/cmp-cmdline" -- Autocompletion plugin
  use "saadparwaiz1/cmp_luasnip" -- Snippets source for nvim-cmp
  use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
  use "hrsh7th/cmp-nvim-lua" -- LSP source for nvim-cmp

  use "L3MON4D3/LuaSnip" -- Snippets plugin

  use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client
  use "williamboman/nvim-lsp-installer"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  use "mhinz/vim-startify" -- fancy start screen
  use "Shatur/neovim-session-manager"

  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "windwp/nvim-autopairs"

  use {
		"nvim-lualine/lualine.nvim",
		requires = {"kyazdani42/nvim-web-devicons", opt = true}
	}

	use {
	  "lewis6991/gitsigns.nvim",
		requires = {
	    "nvim-lua/plenary.nvim"
		},
		tag = "release" -- To use the latest release
	}

  use "ggandor/lightspeed.nvim"

  use "mfussenegger/nvim-dap"
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  use {
    "rcarriga/vim-ultest",
    requires = {"vim-test/vim-test"},
    run = {":UpdateRemotePlugins"}
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

