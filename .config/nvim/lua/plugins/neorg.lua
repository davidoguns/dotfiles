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
                            work = "~/work_notes"
                        }
                    }
                },
                ["core.highlights"] = {},
                ["core.todo-introspector"] = {},
                ["core.qol.toc"] = {},
                ["core.qol.todo_items"] = {
                    config = {
                        create_todo_items = true,
                        create_todo_parents = true
                    }
                },
                ["core.ui"] = {},
            }
        })
    end,
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim"
}
