return {
    {
        "rmagatti/auto-session",
        lazy = false,
        keys = {
            { "<leader>pr", "<cmd>RestoreSession<cr>", desc = "Restores session (cwd)" },
            { "<leader>pd", "<cmd>DeleteSession<cr>",  desc = "Deletes session (cwd)" },
            { "<leader>ps", "<cmd>SaveSession<cr>",    desc = "Saves session (cwd)" },
        },
        config = function()
            require("auto-session").setup({
                --log_level = "debug",
                auto_session_enable_last_session = true,
            })
        end
    },
    
    {
        -- NOTE: if removed, also edit telescope
        "rmagatti/session-lens",
        dependencies = {
            "rmagatti/auto-session",
            "nvim-telescope/telescope.nvim",
        },
        lazy = false,
        config = function()
            require("session-lens").setup({})
        end
    }
}
