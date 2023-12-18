return {
    "rluba/jai.vim",
    version = false,
    lazy = false,
    dependencies = {
        "numToStr/Comment.nvim",
    },
    config = function()
        -- Make Comment work with jai files
        local ft = require("Comment.ft")
        ft({"jai"}, ft.get("c"))

        -- Cursor line only in current active window
        local jai_keybinds = vim.api.nvim_create_augroup("JaiKeybinds", { clear = true })
        vim.api.nvim_create_autocmd("BufEnter", {
            callback = function()
                vim.keymap.set("n", "<leader>?", [[<cmd>lua require('telescope.builtin').live_grep( { cwd = "C:/jai", hidden = true, no_ignore = true })<cr>]], { desc = "Search word in Jai Modules" } )
                vim.keymap.set("n", "<leader>sW", [[<cmd>lua require('telescope.builtin').grep_string( { cwd = "C:/jai", hidden = true, no_ignore = true })<cr>]], { desc = "Search word in Jai Modules" } )
                vim.keymap.set("n", "<leader>fj", [[<cmd>lua require('telescope.builtin').grep_string( { cwd = "C:/jai", hidden = true, no_ignore = true })<cr>]], { desc = "Search in Jai Modules" } )
                vim.keymap.set("n", "<leader>pb", "<cmd>silent make<bar>edit<cr>",  { desc = "Build jai project or file" })
                vim.keymap.set("n", "<leader>pB", function()
                    -- Build current file

                    if vim.b.jai_compilable == nil or vim.b.jai_compilable == false then
                        -- register file
                        vim.o.makeprg = vim.fn.FindJaiCompiler() .. " -no_color -quiet -natvis " .. vim.fn.expand('%:p') .. vim.fn.FindJaiModules()
                        vim.b.jai_compilable = true
                        -- compiler file switching
                        vim.api.nvim_create_autocmd("BufEnter", {
                            callback = function()
                                if vim.b.jai_compilable == true then
                                    vim.o.makeprg = vim.fn.FindJaiCompiler() .. " -no_color -quiet -natvis " .. vim.fn.expand('%:p') .. vim.fn.FindJaiModules()
                                end
                            end,
                            group = jai_keybinds,
                            buffer = 0,
                        })
                        vim.api.nvim_create_autocmd("BufLeave", {
                            callback = function()
                                if vim.b.jai_compilable == true then
                                    vim.fn.UpdateJaiMakeprg()
                                end
                            end,
                            group = jai_keybinds,
                            buffer = 0,
                        })
                    else -- unregister files
                        vim.b.jai_compilable = false
                        vim.fn.UpdateJaiMakeprg()
                    end
                end, { desc = "Build current jai file" } )

                vim.keymap.set("n", "<leader>eb", function()
                    vim.g.lsp_do_build = not vim.g.lsp_do_build
                end, { desc = "Toggle jai auto build" } )
            end,
            group = jai_keybinds,
            pattern = "*.jai",
        })

        vim.api.nvim_create_autocmd("BufLeave", {
            callback = function()
                -- can fail for some reason when opening vim diagnostig floating window with gl
                local ok = pcall(vim.keymap.del, "n", "<leader>?")
                ok = pcall(vim.keymap.del, "n", "<leader>sW")
                ok = pcall(vim.keymap.del, "n", "<leader>fj")
                ok = pcall(vim.keymap.del, "n", "<leader>pb")
                ok = pcall(vim.keymap.del, "n", "<leader>pB")
                ok = pcall(vim.keymap.del, "n", "<leader>eb")
            end,
            group = jai_keybinds,
            pattern = "*.jai",
        })

    end
}
