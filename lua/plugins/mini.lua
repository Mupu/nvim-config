return {
    {
        "echasnovski/mini.bufremove",
        keys = {
            { "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete current buffer" },
        },
        config= function()
            require('mini.bufremove').setup()
        end
    },

    {
        "echasnovski/mini.ai",
        event = "VeryLazy",
        config= function()
            require('mini.ai').setup()
        end
    },

    {
        "echasnovski/mini.indentscope",
        event = "VeryLazy",
        config= function()
            require('mini.indentscope').setup()
        end
    },


    {
        "echasnovski/mini.trailspace",
        event = "VeryLazy",
        keys = {
            ---@diagnostic disable-next-line: undefined-global
            { "<leader>et", function() MiniTrailspace.trim() end, desc = "Trim Whitespaces" },
            ---@diagnostic disable-next-line: undefined-global
            { "<leader>el", function() MiniTrailspace.trim() end, desc = "Trim empty lines at EOF" },
        },
        config = function(_, opts)
            require("mini.trailspace").setup(opts)
        end,
    },

}
