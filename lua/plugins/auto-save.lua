return {
    "Pocco81/auto-save.nvim",
    event = "BufReadPre",
    keys = {
        { "<leader>ea",       "<cmd>ASToggle<cr>",    desc = "Toggle Autosave" },
    },
    config = true,
}
