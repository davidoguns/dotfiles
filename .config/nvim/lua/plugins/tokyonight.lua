return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    init = function(LazyPlugin)
        vim.g.tokyonight_style = "storm"
        vim.g.tokyonight_italic_functions = true
        vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

        -- Load the colorscheme
        vim.cmd[[colorscheme tokyonight]]
        -- Force a tmux-compatible color highlight for the active line
        -- vim.cmd[[hi CursorLine guibg=#000000]]
    end
}
