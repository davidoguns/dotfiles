-- setup null-ns for specifically configured formatters and code linters (diagnostics)
-- Note: a language server can provide formatting and linting information as well so we
-- may want try to use those integrations instead where appropriate. Though even rust_analyzer
-- doesn't even seem to format like rustfmt does so...maybe there are extreme limits
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    formatting.clang_format,
    formatting.cmake_format,
    formatting.rustfmt,
    -- formatting.prettier.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },
    -- formatting.black.with { extra_args = { "--fast" } },
    -- formatting.yapf,
    -- formatting.stylua,
    -- diagnostics.flake8,
  },
}
