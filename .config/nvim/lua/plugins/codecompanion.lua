return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("codecompanion").setup({
            extensions = {
                -- mcphub = {
                --     callback = "mcphub.extensions.codecompanion",
                --     opts = {
                --         make_vars = true,
                --         make_slash_commands = true,
                --         show_result_in_chat = true
                --     }
                -- }
            }
        })
    end
}
