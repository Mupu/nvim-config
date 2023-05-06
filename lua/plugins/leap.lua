return {
    -- s/S movement
    {
        "ggandor/leap.nvim",
        dependencies = {
            "tpope/vim-repeat",
        },
        event = "VeryLazy",
        config = function(_, opts)
            require('leap').add_default_mappings(true)
            -- The same caveats as above about bidirectional search apply here.
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

