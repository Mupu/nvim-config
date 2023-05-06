return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        -- telescope.load_extension("session-lens")
    end,
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
        { "<leader>,",       "<cmd>Telescope buffers show_all_buffers=true<cr>",    desc = "Find Buffer"             },
        { "<leader>/",       "<cmd>Telescope live_grep<cr>",                        desc = "Find in Files"           },
        { "<leader>:",       "<cmd>Telescope command_history<cr>",                  desc = "Command History"         },

        -- { "<leader>fs",      "<cmd>Telescope session-lens search_session<cr>",      desc = "Find Session"            },

        {
            "<leader><space>",
            function()
                local opts = {} -- define here if you want to define something
                vim.fn.system('git rev-parse --is-inside-work-tree')
                if vim.v.shell_error == 0 then
                    require"telescope.builtin".git_files(opts)
                else
                    require"telescope.builtin".find_files(opts)
                end
            end,
            desc = "Find Files (git then cwd)"
        },
        {
            "<leader>fv",
            function()
                require('telescope.builtin').git_files( { cwd = vim.fn.stdpath("config"), hidden = true, no_ignore = true })
            end,
            desc = "Find Nvim Config"
        },
        {
            "<leader>ff",
            function()
                require"telescope.builtin".find_files({ hidden = false, no_ignore = true })
            end,
            desc = "Find all Files (no hidden)"
        },

        {
            "<leader>fF",
            function()
                require"telescope.builtin".find_files({ hidden = true, no_ignore = true })
            end,
            desc = "Find ALL Files"
        },

        { "<leader>fb",      "<cmd>Telescope buffers<cr>",                          desc = "Find Buffers Files"      },
        { "<leader>fg",      "<cmd>Telescope git_files<cr>",                        desc = "Find Git Files"          },
        { "<leader>fr",      "<cmd>Telescope oldfiles<cr>",                         desc = "Recent Files"            },
        { "<leader>sC",      "<cmd>Telescope commands<cr>",                         desc = "Commands"                },
        { "<leader>sa",      "<cmd>Telescope autocommands<cr>",                     desc = "Auto Commands"           },
        { "<leader>sb",      "<cmd>Telescope current_buffer_fuzzy_find<cr>",        desc = "Buffer"                  },
        { "<leader>sc",      "<cmd>Telescope command_history<cr>",                  desc = "Command History"         },
        { "<leader>sg",      "<cmd>Telescope live_grep<cr>",                        desc = "Grep"                    },
        { "<leader>sh",      "<cmd>Telescope help_tags<cr>",                        desc = "Help Pages"              },
        { "<leader>sH",      "<cmd>Telescope highlights<cr>",                       desc = "Search Highlight Groups" },
        { "<leader>sk",      "<cmd>Telescope keymaps<cr>",                          desc = "Key Maps"                },
        { "<leader>so",      "<cmd>Telescope vim_options<cr>",                      desc = "Options"                 },
        { "<leader>st",      "<cmd>Telescope builtin<cr>",                          desc = "Telescope"               },
        { "<leader>sT",      "<cmd>Telescope resume<cr>",                           desc = "Resume Telescope"        },
        { "<leader>sw",      "<cmd>Telescope grep_string<cr>",                      desc = "Search word under cursor"},


        { "<leader>sM",      "<cmd>Telescope man_pages<cr>",                        desc = "Man Pages"               },
        { "<leader>gc",      "<cmd>Telescope git_commits<CR>",                      desc = "commits"                 },
        { "<leader>gs",      "<cmd>Telescope git_status<CR>",                       desc = "status"                  },
        { "<leader>sm",      "<cmd>Telescope marks<cr>",                            desc = "Jump to Mark"            },

        {
            "<leader>ss",
            "<cmd>Telescope lsp_document_symbols<cr>", {
                symbols = {
                    "Class",
                    "Function",
                    "Method",
                    "Constructor",
                    "Interface",
                    "Module",
                    "Struct",
                    "Trait",
                    "Field",
                    "Property",
                },
            },
            desc = "Goto Symbol",
        },
    },
    opts = {
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            mappings = {
                i = {
                    ["<c-t>"] = function(...)
                        return require("trouble.providers.telescope").open_with_trouble(...)
                    end,
                    ["<C-i>"] = function()
                        require"telescope.builtin".find_files({ hidden = false, no_ignore = true })
                    end,
                    ["<C-h>"] = function()
                        require"telescope.builtin".find_files({ hidden = true, no_ignore = false })
                    end,
                    ["<C-Down>"] = function(...)
                        return require("telescope.actions").cycle_history_next(...)
                    end,
                    ["<C-Up>"] = function(...)
                        return require("telescope.actions").cycle_history_prev(...)
                    end,
                },
            },
        },
    },
}
