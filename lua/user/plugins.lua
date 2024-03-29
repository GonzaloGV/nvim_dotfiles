local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", commit = "0aaea32f27315e2a99ba4c12ab9def5cbb4842e4" }) -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use({ "akinsho/bufferline.nvim", branch = "main" })
	use("moll/vim-bbye")
	use("lewis6991/impatient.nvim") -- Load modules faster

	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	-- use("lunarvim/darkplus.nvim")
	use("folke/tokyonight.nvim")
	-- use("ful1e5/onedark.nvim")
	-- use("lunarVim/onedarker.nvim")
	-- use("AlphaTechnolog/onedarker.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig") -- enable LSP
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Telescope
	use("nvim-telescope/telescope.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Lualine
	use("nvim-lualine/lualine.nvim")

	-- Indent Lines
	use("lukas-reineke/indent-blankline.nvim")

	-- Toggle Term - commandline inside vim
	use({ "akinsho/toggleterm.nvim", branch = "main" })

	-- Which-key to check commands
	use("folke/Which-key.nvim")

	-- nofify --
	use("rcarriga/nvim-notify")

	-- display hex colors --
	use("norcalli/nvim-colorizer.lua")

	-- project manager --
	use("ahmedkhalf/project.nvim")

	-- TS autoclosing --
	use("windwp/nvim-ts-autotag")

	-- Test startuptime --
	use("dstein64/vim-startuptime")

	-- multi cursor --
	use("mg979/vim-visual-multi")

	-- treesitter Playground --
	use("nvim-treesitter/playground")
	--
	-- markdown rendered --
	-- use({
	--	"iamcco/markdown-preview.nvim",
	--		run = "cd app && npm install",
	--	setup = function()
	--		vim.g.mkdp_filetypes = { "markdown" }
	--	end,
	--	ft = { "markdown" },
	--})
	-- -- Hydra --
	-- use { 'anuvyklack/hydra.nvim',
	--   requires = 'anuvyklack/keymap-layer.nvim' -- needed only for pink hydras
	-- }

	-- openscad --
	-- use({
	-- 	"salkin-mada/openscad.nvim",
	-- 	config = function()
	-- 		require("openscad")
	-- 		-- load snippets, note requires
	-- 		vim.g.openscad_load_snippets = true
	-- 	end,
	-- 	requires = "L3MON4D3/LuaSnip",
	-- })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
