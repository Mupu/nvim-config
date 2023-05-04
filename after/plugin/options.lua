local set = vim.o
-- Theme
set.termguicolors     = true
set.background        = "dark"
set.title             = true 				-- Sets terminal title to current file name
set.relativenumber    = true
set.number            = true
set.scrolloff         = 8
set.showtabline       = 2
set.cursorline        = false               -- set by autocmd
set.cmdheight         = 1
set.signcolumn 		  = "yes" 			    -- leave space for symbols
set.backspace         = "indent,eol,start"

-- Other
vim.cmd.GuiFont       { "Hack NFM:h11", bang = true }
set.encoding          = "UTF-8"
set.autoread          = true                -- Auto reload file if written externally
set.clipboard         = "unnamedplus"       -- Use systemp clipboard
set.updatetime 		  = 50 				    -- Decrease update time (used for CursorHold event)
set.timeoutlen        = 300
--set.secure            = true
--set.exrc              = true
set.virtualedit       = "all"               -- allow editing everytwhere, avoid space spamming
set.sessionoptions    = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- Folding
set.foldmethod        = "indent"
set.foldlevel         = 999                 -- Dont close anything

-- Splits
set.splitbelow        = true
set.splitright        = true

-- Files
set.swapfile          = false
set.backup            = false
set.undofile          = true
set.undodir           = vim.fn.expand("$HOME") .. "/AppData/Local/nvim-data/undodir"

-- Wrap settings
set.wrap              = true
set.textwidth         = 100
set.colorcolumn		  = "100"
set.showbreak         = "↳"
set.breakindent       = true

-- Auto complete
set.completeopt       = "menu,menuone,noselect"
set.wildmenu          = true
-- Add all sub paths with path to find files etc.
set.path              = set.path .. "**" .. ","
set.wildmode          = "longest,list,full"
-- Ignore files
set.wildignore        = set.wildignore .. "**/.git/*" .. ","

-- Indenting
set.tabstop 		  = 4
set.softtabstop 	  = 4
set.shiftwidth 		  = 4
set.expandtab 		  = true
set.autoindent        = true
set.smartindent       = true

-- Search
set.smartcase         = true
set.ignorecase        = true
set.incsearch         = true
set.hlsearch          = true
