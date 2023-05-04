return {
    -- s/S movement
    {
        "ggandor/leap.nvim",
        dependencies = {
            "tpope/vim-repeat",
        },
        keys = {
        },
        event = "VeryLazy",
        config = function(_, opts)
            require('leap').add_default_mappings()
        end
    },
    -- f/F t/T movement
    {
        "ggandor/flit.nvim",
        dependencies = {
            "ggandor/leap.nvim",
        },
        event = "VeryLazy",
        opts = {
            labeled_modes  = "nv",
        },
        config = true,
    }
}

