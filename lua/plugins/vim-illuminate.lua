return {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
        local colors = require("gruvbox").palette
        local config = require("gruvbox").config
        vim.api.nvim_set_hl(0, "IlluminatedWordText",  { bg = colors.dark2, reverse = config.invert_selection })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead",  { bg = colors.dark2, reverse = config.invert_selection })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = colors.dark2, reverse = config.invert_selection })
        vim.api.nvim_set_hl(0, "Visual",               { bg = colors.dark4, reverse = config.invert_selection })
    end
}
