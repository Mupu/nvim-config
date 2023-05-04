-- which-key
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        plugins = { spelling = true }, -- enable spelling suggestions menu
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register({
            mode = { "n", "v" },
            --["<leader>"] = { name = "+leader" },
            ["g"] = { name = "+goto" },
            ["]"] = { name = "+next" },
            ["["] = { name = "+prev" },
            ["<leader>b"] = { name = "+buffer" },
            ["<leader>f"] = { name = "+file search" },
            ["<leader>q"] = { name = "+quit/session" },
            ["<leader>s"] = { name = "+search word" },
            ["<leader>p"] = { name = "+project" },
            ["<leader>e"] = { name = "+editor" },

            --["<leader>x"] = { name = "+diagnostics/quickfix" },
            --["<leader>w"] = { name = "+windows" },
            --["<leader>sn"] = { name = "+noice" },
            --["<leader>u"] = { name = "+ui" },
            --["<leader>g"] = { name = "+git" },
            --["<leader>gh"] = { name = "+hunks" },
        })
    end,
}
