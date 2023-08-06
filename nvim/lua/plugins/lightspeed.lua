return {
    "ggandor/lightspeed.nvim",
    config = function()
        require'lightspeed'.setup {
            ignore_case = false,
            exit_after_idle_msecs = { unlabeled = 1000, labeled = nil },

            -- s/x
            jump_to_unique_chars = { safety_timeout = 400 },
            match_only_the_start_of_same_char_seqs = true,
            substitute_chars = { ['\r'] = '¬' },
            -- Leaving the appropriate list empty effectively disables
            -- "smart" mode, and forces auto-jump to be on or off.
            -- safe_labels = { },
            -- labels = { },

            -- f/t
            limit_ft_matches = 4,
            repeat_ft_with_target_char = false,
            special_keys =
            {
                next_match_group = '<space>',
                prev_match_group = '<tab>'
            }
        }

        vim.cmd[[hi LightspeedGreywash guifg=none guibg=none]]
    end
}
