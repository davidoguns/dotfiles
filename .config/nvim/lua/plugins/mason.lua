return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim", "lvimuser/lsp-inlayhints.nvim" },
    config = function()
        require("mason").setup{
            ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "cmake", "jsonls" }
        }
        require("mason-lspconfig").setup()

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('my.lsp', {}),
            callback = function(args)
                local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                -- Server capabilities spec:
                -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
                if client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
                    vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
                    vim.api.nvim_create_autocmd("CursorHold", {
                        callback = vim.lsp.buf.document_highlight,
                        buffer = bufnr,
                        group = "lsp_document_highlight",
                        desc = "Document Highlight",
                    })
                    vim.api.nvim_create_autocmd("CursorMoved", {
                        callback = vim.lsp.buf.clear_references,
                        buffer = bufnr,
                        group = "lsp_document_highlight",
                        desc = "Clear All the References",
                    })
                    vim.api.nvim_create_autocmd("CursorHoldI", {
                        callback = vim.lsp.buf.document_highlight,
                        buffer = bufnr,
                        group = "lsp_document_highlight",
                        desc = "Document Highlight",
                    })
                    vim.api.nvim_create_autocmd("CursorMovedI", {
                        callback = vim.lsp.buf.clear_references,
                        buffer = bufnr,
                        group = "lsp_document_highlight",
                        desc = "Clear All the References",
                    })
                end
             end,
        })
    end
}
