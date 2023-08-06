return {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {"]d", "<cmd>Gitsigns next_hunk<CR>",
            desc = "NextHunk"},
        {"[d", "<cmd>Gitsigns prev_hunk<CR>",
            desc = "PreviousHunk"},
        {"<leader>D", "<cmd>Gitsigns preview_hunk<CR>",
            desc = "PreviewHunk"},
    },
    config = function()
        require('gitsigns').setup {
            watch_gitdir = {
                interval = 5000,
                follow_files = true
            },
            attach_to_untracked = true,
            current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 300,
                ignore_whitespace = false,
            },
            current_line_blame_formatter_opts = {
                relative_time = true
            },
        }
    end,
}
