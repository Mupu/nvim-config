return {
    -- NOTE: if removed, also edit telescope
    "mbbill/undotree",
    config = function()
        vim.g.undotree_SetFocusWhenToggle = 1;
    end,
    keys = {
        { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Open Undotree" },
    }
}
