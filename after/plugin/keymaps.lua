-- These are general keymap, the plugins will have their own keymaps

-- Trick Align Block: select    :'<,'>:normal f=30i ^[19|dw      ctrl+v Esc to make ^[

-- Debug
vim.keymap.set("n", "<leader>d", [[:echo synIDattr(synID(line("."), col("."), 1), "name")<cr>]], { desc = "Show highlightgroup name under cursor" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>",  { desc = "Quit all" })
vim.keymap.set("n", "<leader>qw", "<cmd>wqa<cr>", { desc = "Quit and write all" })
vim.keymap.set("n", "<leader>qQ", "<cmd>qa!<cr>", { desc = "Quit all (force)" })

-- New File
vim.keymap.set("n", "<leader>fn", ":enew<cr>",   { desc = "Edit new empty buffer" })

-- Buffers
vim.keymap.set("n", "<leader>bb", "<cmd>e#<cr>", { desc = "Switch to last buffer" })

-- Quick Lists
vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Open Location List" })
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Open Quickfix List" })

-- Replace hovered word in file
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace hovered word in file" })

-- Open lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Open Lazy" })

-- I hate q
-- vim.keymap.set("n", "q", "<Nop>",   { desc = "I hate q" })

-- Better Pasting
vim.keymap.set("v", "p", "\"_dP", { desc = "Dont place replaced text into clipboard" })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Make everything leavable with C-z
vim.keymap.set("t", "<C-z>", "<C-\\><C-n>", { desc = "Leave terminal" })
-- So that V-mode insert doesnt delete everything
vim.keymap.set("i", "<C-c>", "<Esc>",       { desc = "Make V-mode insert not cancel" })

-- Stop cursor from moving
vim.keymap.set({ "n", "v" }, "<Space>",     "<Nop>", { desc = "Make space not move cursor" })
vim.keymap.set({ "n", "v" }, "<Backspace>", "<Nop>", { desc = "Make backspace not move cursor" })
vim.keymap.set({ "n", "v" }, "<Enter>",     "<Nop>", { desc = "Make enter not move cursor" })

-- Remap for dealing with word wrap
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move cor up on wordwrap" })
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move cursor down on wordwrap" })

-- Tabbing
vim.keymap.set("n", "<Tab>", 	  ">>_",   { desc = "Tab current line" })
vim.keymap.set("n", "<S-Tab>", 	"<<_",   { desc = "Remove Tab current line" }	)
vim.keymap.set("i", "<S-Tab>", 	"<C-D>", { desc = "Remove Tab current line" })
vim.keymap.set("v", "<Tab>", 	  ">gv",   { desc = "Tab selected lines" })
vim.keymap.set("v", "<S-Tab>", 	"<gv",   { desc = "Remove Tab selected lines" })

-- Buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

local toggle_qf = function()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
        if win["quickfix"] == 1 then
            qf_exists = true
        end
    end

    if qf_exists == true then
        vim.cmd "cclose"
        return
    end
    if not vim.tbl_isempty(vim.fn.getqflist()) then
        vim.cmd "copen"
    end
end

-- Quickfix List
vim.keymap.set("n", "<leader>eq", function() toggle_qf() end, { desc = "Toggle Quickfix" })
vim.keymap.set("n", "[q", ":cprev<cr>", { desc = "Previous Quickfix List entry" })
vim.keymap.set("n", "]q", ":cnext<cr>", { desc = "Next Quickfix List entry" })
vim.keymap.set("n", "[Q", ":cfirst<cr>", { desc = "Previous Quickfix List entry" })
vim.keymap.set("n", "]Q", ":clast<cr>", { desc = "Next Quickfix List entry" })

-- Location List
vim.keymap.set("n", "[l", ":lprev<cr>", { desc = "Previous Location List entry" })
vim.keymap.set("n", "]l", ":lnext<cr>", { desc = "Next Location List entry" })
vim.keymap.set("n", "[L", ":lfirst<cr>", { desc = "First Location List entry" })
vim.keymap.set("n", "]L", ":llast<cr>", { desc = "Last Location List entry" })

-- Move lines
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==",        { desc = "Move line up" })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==",        { desc = "Move line down" })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" } 	)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" } 	)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv",    { desc = "Move lines up" } 	)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv",    { desc = "Move lines down" } 	)

-- Keep cursor in the middle when moving around
if not require("lazy.core.config").plugins["vim-smoothie"] then
    vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "<C-u> and center screen"})
    vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "<C-d> and center screen" })
    vim.keymap.set("n", "n", "nzzzv", { desc = "n and center screen"} )
    vim.keymap.set("n", "N", "Nzzzv", { desc = "N and center screen"} )
end

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>",    "<cmd>resize +2<cr>",          { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>",  "<cmd>resize -2<cr>",          { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>",  "<cmd>vertical resize -2<cr>", { desc = "Decrease window width"  })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width"  })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Font size
vim.cmd([[
    command! Bigger  :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
    command! Smaller :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')
]])
vim.keymap.set("n", "<c-=>", ":Bigger<cr>",  { silent = true, desc = "Increase Font Size"} )
vim.keymap.set("n", "<c-->", ":Smaller<cr>", { silent = true, desc = "Decrease Font Size"} )

-- https://github.com/mhinz/vim-galore#saner-command-line-history
-- Didnt get up/down keycodes to work
vim.cmd([[
    cnoremap <expr> <c-n> wildmenumode() ? "\<c-n>" : "\<down>"
    cnoremap <expr> <c-p> wildmenumode() ? "\<c-p>" : "\<up>"
]])

