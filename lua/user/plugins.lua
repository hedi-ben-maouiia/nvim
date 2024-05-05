
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- Install your plugins here
    require("lazy").setup({
	-- My plugins here
	"windwp/nvim-autopairs", -- An autopair
	"nvim-lua/plenary.nvim",
	"kyazdani42/nvim-web-devicons", -- File icons
	"nvim-telescope/telescope.nvim", -- fzf file viewer
	"nvim-telescope/telescope-file-browser.nvim", -- file browser
	"jose-elias-alvarez/null-ls.nvim", -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	"glepnir/lspsaga.nvim", -- LSP UIs
	"norcalli/nvim-colorizer.lua", -- highlights the hexa value according to thier colors
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},	
    "akinsho/toggleterm.nvim", -- terminal
	"nvim-lualine/lualine.nvim", -- status line/bar
	"lewis6991/gitsigns.nvim", -- git signs for editing or any changes
	"numToStr/Comment.nvim", -- comment
	"JoosepAlviste/nvim-ts-context-commentstring", -- jsx commenting
	"yamatsum/nvim-cursorline",
	"lukas-reineke/indent-blankline.nvim",

	"RRethy/vim-illuminate",
	"lewis6991/impatient.nvim",
	"onsails/lspkind.nvim",

	-- Themes
	"navarasu/onedark.nvim",
	"folke/tokyonight.nvim",
	"morhetz/gruvbox",
	"sainnhe/gruvbox-material",
	"tanvirtin/monokai.nvim",

	-- Language servers
	{ "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },


	-- Auto complete
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-nvim-lua",

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use
    
    -- Orgmode
    {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = { 'org' },
        config = function()
            -- Setup orgmode
            require('orgmode').setup({
                org_agenda_files = '~/orgfiles/**/*',
                org_default_notes_file = '~/orgfiles/refile.org',
            })

            -- NOTE: If you are using nvim-treesitter with `ensure_installed = "all"` option
            -- add `org` to ignore_install
            -- require('nvim-treesitter.configs').setup({
            --   ensure_installed = 'all',
            --   ignore_install = { 'org' },
            -- })
        end,
    },
    {
        'akinsho/org-bullets.nvim',
        config = function()
            require('org-bullets').setup() 
        end
    },   

    -- for syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},


	"lervag/vimtex",
	{
		"vimwiki/vimwiki",
		config = function()
			vim.g.vimwiki_list = {
				{
					path = "~/vimwiki",
					syntax = "markdown",
					ext = ".md",
				},
			}

			vim.g.vimwiki_ext2syntax = {
				[".md"] = "markdown",
				[".markdown"] = "markdown",
				[".mdown"] = "markdown",
			}
			vim.g.vimwiki_global_ext = 0 -- don't treat all md files as vimwiki
		end,
	},
  -- Lua
    {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
    end,
    }
})
