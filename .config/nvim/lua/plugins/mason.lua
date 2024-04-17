return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim", "lvimuser/lsp-inlayhints.nvim" },
    config = function()
        require("mason").setup{
            ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "cmake", "jsonls" }
        }
        require("mason-lspconfig").setup()
        require("mason-lspconfig").setup_handlers {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function (server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup {}
            end,
        }

        vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
        vim.api.nvim_create_autocmd("LspAttach", {
            group = "LspAttach_inlayhints",
            callback = function(args)
                if not (args.data and args.data.client_id) then
                    return
                end

                local bufnr = args.buf
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                require("lsp-inlayhints").on_attach(client, bufnr)
                  --- Guard against servers without the signatureHelper capability
                if client.server_capabilities.signatureHelpProvider then
                    require('lsp-overloads').setup(client, { })
                end
            end,
        })
    end
}
