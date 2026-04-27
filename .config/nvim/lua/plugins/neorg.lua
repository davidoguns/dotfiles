return {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    dependencies = { "nvim-neorg/tree-sitter-norg", "nvim-neorg/tree-sitter-norg-meta" },
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
    -- run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim"
}
