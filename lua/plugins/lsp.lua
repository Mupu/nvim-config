return {
    {
        -- https://github.com/VonHeikemen/lsp-zero.nvim
        "VonHeikemen/lsp-zero.nvim",
        lazy = false,
        version = "v2.x",
        dependencies = {
            -- LSP Support
            {"neovim/nvim-lspconfig"},             -- Required
            {"williamboman/mason.nvim"},           -- Optional
            {"williamboman/mason-lspconfig.nvim"}, -- Optional

            -- Autocompletion
            {"hrsh7th/nvim-cmp"},         -- Required
            {"hrsh7th/cmp-nvim-lsp"},     -- Required
            {"hrsh7th/cmp-buffer"},       -- Optional
            {"hrsh7th/cmp-path"},         -- Optional
            {"saadparwaiz1/cmp_luasnip"}, -- Optional
            {"hrsh7th/cmp-nvim-lua"},     -- Optional

            -- Snippets
            {"L3MON4D3/LuaSnip"},             -- Required
            {"rafamadriz/friendly-snippets"}, -- Optional
        },
        config = function()
            -- Learn the keybindings, see :help lsp-zero-keybindings
            -- Learn to configure LSP servers, see :help lsp-zero-api-showcase
            local lsp = require("lsp-zero")
            lsp.preset('recommended')

            -- (Optional) Configure lua language server for neovim
            lsp.nvim_workspace()

            lsp.setup()

            -- Setup vim lsp
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = false,
                float = true,
            })
        end,
        keys = {
            -- They are already set by lsp-zero, but i need them even if no lsp is attached for e.g. jai
            { "K",      "<cmd>lua vim.lsp.buf.hover()<cr>",             desc = "Information about the symbol" },
            { "gd",     "<cmd>lua vim.lsp.buf.declaration()<cr>",       desc = "Jump definition" },
            { "gD",     "<cmd>lua vim.lsp.buf.definition()<cr>",        desc = "Jump declaration" },
            { "gi",     "<cmd>lua vim.lsp.buf.implementation()<cr>",    desc = "Qickfix all implementations" },
            { "go",     "<cmd>lua vim.lsp.buf.type_definition()<cr>",   desc = "Jump type definition" },
            { "gr",     "<cmd>lua vim.lsp.buf.references()<cr>",        desc = "Quickfix all references" },
            { "<c-k>",  "<cmd>lua vim.lsp.buf.signature_help()<cr>",    desc = "Show signiture information" },
            { "F2",     "<cmd>lua vim.lsp.buf.rename()<cr>",            desc = "Rename references" },
            { "F4",     "<cmd>lua vim.lsp.buf.code_action()<cr>",       desc = "Show available code actions" },
            { "gl",     "<cmd>lua vim.diagnostic.open_float()<cr>",     desc = "Show diagnostic window" },
        }
    },
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        event = "VeryLazy",
        keys = {
            { "<leader>px",     [[<cmd> TroubleToggle<cr>]], desc = "Project diagnostic" },
            { "[D",     [[<cmd>lua require("trouble").first({skip_groups = true, jump = true})<cr>]], desc = "Jump frist diagnostic" },
            { "[d",     [[<cmd>lua require("trouble").previous({skip_groups = true, jump = true})<cr>]], desc = "Jump previous diagnostic" },
            { "[D",     [[<cmd>lua require("trouble").last({skip_groups = true, jump = true})<cr>]], desc = "Jump last diagnostic" },
            { "]d",     [[<cmd>lua require("trouble").next({skip_groups = true, jump = true})<cr>]], desc = "Jump next diagnostic" },
        },
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end

    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        lazy = false,
        config = function ()
            local null_ls = require("null-ls")
            local null_ls_helpers = require("null-ls.helpers")

            null_ls.setup({ debug = true })

            -- local jai_null_lsp = {
            --     method = null_ls.methods.DIAGNOSTICS,
            --     filetypes = { "jai" },
            --     generator = {
            --         multiple_files = true,
            --         fn = function(params)
            --             local diagnostics = {}
            --             local qferrors = vim.fn.getqflist()
            --             -- sources have access to a params object
            --             -- containing info about the current file and editor state
            --             for i, error in ipairs(qferrors) do
            --                 if error.valid == 1 then
            --                     table.insert(diagnostics, {
            --                         bufnr = error.bufnr,
            --                         row = error.lnum,
            --                         end_row = error.end_lnum,
            --                         col = error.col,
            --                         end_col = error.end_col,
            --                         source = "jai_null_lsp",
            --                         message = error.text,
            --                         severity = vim.diagnostic.severity.ERROR,
            --                     })
            --                 end
            --             end
            --             -- for i, line in ipairs(params.content) do
            --             --     local col, end_col = line:find("really")
            --             --     if col and end_col then
            --             --         -- null-ls fills in undefined positions
            --             --         -- and converts source diagnostics into the required format
            --             --         table.insert(diagnostics, {
            --             --             row = i,
            --             --             col = col,
            --             --             end_col = end_col + 1,
            --             --             source = "no-really",
            --             --             message = "Don't use 'really!'",
            --             --             severity = vim.diagnostic.severity.WARN,
            --             --         })
            --             --     end
            --             -- end
            --             return diagnostics
            --         end,
            --     },
            -- }
            -- null_ls.register(jai_null_lsp)

            local jai_compile = {
                method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
                source = "jai_null_lsp",
                filetypes = { "jai" },
                generator = null_ls.generator({
                    command = "jai",
                    -- args = function ()
                    --     vim.cmd.echom[[called]]
                    --     return [ "test.jai" ]
                    -- end,
                    args = { "test.jai" },
                    -- dynamic_command = function ()
                    --     return "jai.exe test.jai"
                    -- end,
                    format = "line",
                    from_stderr = true,
                    multiple_files = true,
                    on_output = null_ls_helpers.diagnostics.from_patterns({
                        {
                            pattern = [[(.+):(%d+),(%d+): Error: (.+)]],
                            groups = { "filename", "row", "col", "message" }
                        },
                        {
                            pattern = [[(.+):(%d+),(%d+): (.+)]],
                            groups = { "filename", "row", "col", "message" }
                        },
                        -- {
                        --     pattern = [[(.+) \((.+):(%d+)\)]],
                        --     groups = { "message","filename", "row" }
                        -- },
                    })
                })
            }

            null_ls.register(jai_compile)
        end
    },
}
