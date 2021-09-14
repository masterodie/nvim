local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd("packadd packer.nvim")
end

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("tomasr/molokai")
	use("morhetz/gruvbox")

	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("Raimondi/delimitMate")

	use({
		"mhinz/vim-startify",
		config = function()
			require("odie.plugins.startify")
		end,
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("odie.plugins.which-key")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("odie.plugins.treesitter")
		end,
		requires = {
			{ "windwp/nvim-ts-autotag" },
		},
	})

	use("editorconfig/editorconfig-vim")

	use({
		"preservim/nerdcommenter",
		config = function()
			require("odie.plugins.nerdcommenter")
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("odie.plugins.nvim-tree")
		end,
		requires = {
			{ "kyazdani42/nvim-web-devicons" },
		},
	})

	use("tpope/vim-fugitive")
	use("tpope/vim-git")
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("odie.plugins.nvim-lspconfig")
		end,
		requires = {
			{ "3nuc/nvim-lspinstall" },
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("odie.plugins.null-ls")
				end,
				requires = {
					{ "nvim-lua/plenary.nvim" },
				},
			},
		},
	})

	use("hrsh7th/cmp-nvim-lsp")

	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("odie.plugins.nvim-cmp")
		end,
	})

	use("sukima/xmledit")
	use("mattn/emmet-vim")

	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
		requires = {
			{ "kyazdani42/nvim-web-devicons" },
		},
	})

	use({
		"aserowy/tmux.nvim",
		config = function()
			require("odie.plugins.tmux")
		end,
	})

	use({
		"glepnir/galaxyline.nvim",
		branch = "main",
		config = function()
			require("odie.galaxyline.odie")
		end,
		requires = {
			{ "kyazdani42/nvim-web-devicons", opt = true },
		},
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
	})
	use({ "dcampos/nvim-snippy", requires = { "honza/vim-snippets", "dcampos/cmp-snippy" } })
end)
