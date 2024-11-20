return {
    "nvim-neorg/neorg",
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {}
            }
        })
    end
}
