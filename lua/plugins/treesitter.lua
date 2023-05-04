--
-- NOTE: on windows you need this https://github.com/skeeto/w64devkit
--

return {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = "BufReadPost",
    keys = {
        -- { "<c-space>", desc = "Increment selection" },
        -- { "<bs>", desc = "Schrink selection", mode = "x" },
    },
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        context_commentstring = { enable = true, enable_autocmd = false },
        ensure_installed = {
            "bash",
            "vimdoc",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "tsx",
            "typescript",
            "vim",
            "yaml",
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                -- init_selection = "<C-space>",
                -- node_incremental = "<C-space>",
                -- scope_incremental = "<nop>",
                -- node_decremental = "<bs>",
            },
        },
    },
    config = function(plugin, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
