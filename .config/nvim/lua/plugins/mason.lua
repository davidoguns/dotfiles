return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim", "lvimuser/lsp-inlayhints.nvim" },
    config = function()
        require("mason").setup{
            ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "cmake", "jsonls" }
        }
        require("mason-lspconfig").setup()
    end
}
