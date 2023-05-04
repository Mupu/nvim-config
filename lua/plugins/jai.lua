return {
    "rluba/jai.vim",
    version = false,
    lazy = false,
    dependencies = {
        "numToStr/Comment.nvim",
    },
    config = function()
        local ft = require("Comment.ft")
        ft({"jai"}, ft.get("c"))

        -- Cursor line only in current active window
        local jai_keybinds = vim.api.nvim_create_augroup("JaiKeybinds", { clear = true })
        vim.api.nvim_create_autocmd("BufEnter", {
            callback = function()
                vim.keymap.set("n", "<leader>?", [[<cmd>lua require('telescope.builtin').live_grep( { cwd = "C:/jai", hidden = true, no_ignore = true })<cr>]], { desc = "Search current word in Jai Modules" } )
                vim.keymap.set("n", "<leader>sW", [[<cmd>lua require('telescope.builtin').grep_string( { cwd = "C:/jai", hidden = true, no_ignore = true })<cr>]], { desc = "Search in Jai Modules" } )
            end,
            group = jai_keybinds,
            pattern = "*.jai",
        })
        vim.api.nvim_create_autocmd("BufLeave", {
            callback = function()
                vim.keymap.del("n", "<leader>?")
                vim.keymap.del("n", "<leader>sW")
            end,
            group = jai_keybinds,
            pattern = "*.jai",
        })

    end
}
