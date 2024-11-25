return {
    "nvim-neorg/neorg",
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp"
                    }
                },
                ["core.concealer"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            personal = "~/personal_notes",
                            notes = "~/work_notes"
                        }
                    }
                },
                ["core.highlights"] = {},
                ["core.todo-introspector"] = {},
                ["core.qol.toc"] = {},
                ["core.ui"] = {},
            }
        })
    end,
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim"
}