return {
    "ggandor/leap.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require('leap').add_default_mappings()
    end
}
