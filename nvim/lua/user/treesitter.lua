local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = {"c", "java", "rust", "lua", "python"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  -- indent = { enable = true, disable = { "yaml" } },
  indent = { enable = true, disable = { } },
  context_commentstring = {
    enable = true,
    -- From nvim-ts-context-commentstring doc: https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    -- The default behavior is to trigger commentstring updating on CursorHold. If your
    -- updatetime setting is set to a high value, then the updating might not be triggered.
    -- enable_autocmd = false,
  }
}

