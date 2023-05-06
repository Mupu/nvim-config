-- Automatically choose compiler on filetype.
vim.cmd([[
    au BufRead * try | silent execute "compiler ".&filetype | catch /./ | endtry
]])

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        pcall(vim.highlight.on_yank) -- can error in virtualedit
    end,
    group = highlight_group,
    pattern = "*",
})

-- Cursor line only in current active window
local cursorline_group = vim.api.nvim_create_augroup("CursorLineRemover", { clear = true })
vim.api.nvim_create_autocmd("WinEnter", {
    callback = function()
        vim.o.cursorline = true
    end,
    group = cursorline_group,
    pattern = "*",
})
vim.api.nvim_create_autocmd("WinLeave", {
    callback = function()
        vim.o.cursorline = false
    end,
    group = cursorline_group,
    pattern = "*",
})

-- Load local project settings file.
-- Carefull, can be called multiple times if directory is changed
local nvim_project = vim.api.nvim_create_augroup("NvimProject", { clear = true })
vim.api.nvim_create_autocmd({"DirChanged", "VimEnter"}, {
    callback = function()
        local file = vim.fn.findfile(".nvim.lua", ";") -- find file upwards
        if vim.secure.read(file) ~= nil then
            vim.cmd.source(file)
        end
    end,
    group = nvim_project,
    nested = true,
    pattern = "*",
})

