return {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    keys = {
        { "<leader>pt", "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        search = {
            -- regex that will be used to match keywords.
            -- don't replace the (KEYWORDS) placeholder
            --pattern = [[\b(KEYWORDS):\b]], -- ripgrep regex
            --pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
        },
        highlight = {
            -- pattern = [[.*\((KEYWORDS)\s*:\)\|\(@(KEYWORDS)\)\c]], -- .*<(KEYWORDS)\s*:
            --pattern = [[\c.*<@=(KEYWORDS)\s*:=]], -- .*<(KEYWORDS)\s*:
        },
        merge_keywords = false,
        keywords = {
            FIX = {
                -- LEAK:     sdf
                -- TODO:

                -- leak: fasdfas

                -- LEAK     sdf

                -- FIX  no :
                -- FIX: with :
                -- fix: with :

                -- @FIX asdf

                -- TODO:
                -- @fix: asdf
                icon = " ", -- icon used for the sign, and in search results todo:    hack: asdf
                color = "error", -- can be a hex color, or a named color (see below)
                alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                -- signs = false, -- configure signs for some keywords individually
            },
            TODO = {
                icon = " ",
                color = "info",
                -- a set of other keywords that all map to this
                alt = { "INCOMPLETE", "CLEANUP", "TEMPORARY", "TEMP", "INVESTIGATE" },
            },
            HACK = { icon = " ", color = "warning" },
            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
            PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            NOTE = { icon = " ", color = "hint", alt = { "INFO", "LEAK" } },
            TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
    },
}
