--
-- NOTE: on windows you need this https://github.com/skeeto/w64devkit
--

-- Must happen before plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Download packet manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	-- make everything lazy load
	defaults = {
		lazy = true,
		-- version = "*", -- disabled because it broke mason-lspconfig
	},

	-- set colorscheme
	install = {
		colorscheme = { "gruvbox" }, -- use it even on first install
	},
	
	-- enable automatic updates
	checker = {
		enabled = true,
	},

	-- load plugins
	spec = {
        -- Colorscheme
		{
			"ellisonleao/gruvbox.nvim",
			lazy = false, -- make sure we load this during startup if it is your main colorscheme
			priority = 1000, -- make sure to load this before all the other start plugins
            version = false, -- 1.0.0 release was to old
			config = function()
				-- load the colorscheme here
                local colors = require("gruvbox.palette")
                require("gruvbox").setup({
                    italic = {
                        strings = true,
                        comments = true,
                        operators = true,
                        folds = true,
                    },
                })
				vim.cmd([[colorscheme gruvbox]])
			end,
		},

        -- Needed for nvim-qt
        { "equalsraf/neovim-gui-shim", lazy = false },

		-- plugins folder
		{ import = "plugins" },

	},
})
