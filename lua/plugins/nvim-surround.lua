return {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    version = false,
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
            keymaps = {
                insert = "<C-g>s",          -- default
                insert_line = "<C-g>S",
                normal = "ys",
                normal_cur = "yss",
                normal_line = "yS",
                normal_cur_line = "ySS",
                visual = "gs",
                visual_line = "gS",
                delete = "ds",
                change = "cs",
            },
        })
    end,
}
