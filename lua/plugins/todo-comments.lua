return {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    keys = {
        { "<leader>pt", "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function ()
        local opts = {
            highlight = {
                pattern = { [[.*[@\\]{1}<(KEYWORDS)\s*]], [[.*<(KEYWORDS)\s*:]] },
                keyword = "bg",
            },
            search = {
                pattern = [[[\\\\@]*\b(KEYWORDS)(\s|:)]],
            },

            merge_keywords = false,
            -- @TODO asdfasdf
            -- @INCOMPLETE asdfasdf
            -- @CLEANUP asdfasdf
            -- @FIX asdfasdf
            -- @OPTIMIZE asdfasdf
            -- @LEAK asdfasdf
            -- @hack asdfasdf
            -- @TEMPORARY asdfasdf
            -- @INVESTIGATE asdfasdf
            -- @NOTE: asdfasdf
            -- @WARNING: asdfasdf

            -- @todo asdfasdf
            -- @incomplete asdfasdf
            -- @cleanup asdfasdf
            -- @fix asdfasdf
            -- @optimize asdfasdf
            -- @leak asdfasdf
            -- @hack asdfasdf
            -- temporary: asdf fix: asdfasdf
            -- @investigate asdfasdf
            -- @note: asdfasdf
            -- @warning: asdfasdf

            -- TODO: asdfasdf
            -- INCOMPLETE: asdfasdf
            --
            -- CLEANUP: asdfasdf
            --
            -- FIX: asdfasdf
            -- OPTIMIZE: asdfasdf
            -- LEAK: asdfasdf
            -- HACK: asdfasdf
            -- TEMPORARY: asdfasdf
            -- INVESTIGATE: asdfasdf
            -- NOTE: asdfasdf
            -- WARNING: asdfasf
            -- TEST: fasdfas


            -- todo: asdfasdf
            -- incomplete: asdfasdf
            -- cleanup: asdfasdf
            -- fix: asdfasdf
            -- optimize: asdfasdf
            -- leak: asdfasdf
            -- hack: asdfasdf
            -- temporary: asdfasdf
            -- investigate: asdfasdf
            -- note: asdfasdf
            -- warning: asdfasdf
            -- TEMPORARY: 
            -- hack: 
            -- OPTIM: asdfasdf
            keywords = {
                FIX  = { icon = " ", color = "error",   alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, },
                TODO = { icon = " ", color = "info",    alt = { "INCOMPLETE", "INVESTIGATE" } },
                HACK = { icon = " ", color = "warning", alt = { "CLEANUP", "TEMPORARY", "TEMP", }, },
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                PERF = { icon = " ", color = "test",    alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = " ", color = "hint",    alt = { "INFO", "LEAK" } },
                TEST = { icon = "⏲ ", color = "test",    alt = { "TESTING", "PASSED", "FAILED" } },
            },
            colors = {
                error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
                warning = { "Debug", "WarningMsg", "#FBBF24" },
                info = { "DiagnosticInfo", "#2563EB" },
                hint = { "DiagnosticHint", "#10B981" },
                default = { "Identifier", "#7C3AED" },
                test = { "DiagnosticWarn", "Identifier", "#FF00FF" }
            },
        }

        local keywords_iter = vim.deepcopy(opts.keywords)
        -- Add lowercase versions of each keyword
        for key, val in pairs(keywords_iter) do
            keywords_iter[key].alt = keywords_iter[key].alt or {}
            opts.keywords[key].alt = opts.keywords[key].alt or {}

            -- add lowercase key
            table.insert(opts.keywords[key].alt, key:lower())

            -- lower case version of alt
            for i, name in ipairs(keywords_iter[key].alt) do
                table.insert(opts.keywords[key].alt, name:lower())
            end
        end
        require("todo-comments").setup(opts)
    end,
}
