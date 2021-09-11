local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(
function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'tomasr/molokai'

  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'Raimondi/delimitMate'
  use {
    'mhinz/vim-startify',
    config = function()
      require("odie.plugins.startify")
    end
  }

  use 'kyazdani42/nvim-web-devicons'

  use {
    'folke/which-key.nvim',
    config = function()
      require("odie.plugins.which-key")
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require("odie.plugins.treesitter")
    end
  }

  --[[
  use {
  'junegunn/fzf.vim',
  requires = 'junegunn/fzf'
  }
  ]]--

  use 'editorconfig/editorconfig-vim'

  use {
    'preservim/nerdcommenter',
    config = function()
      require("odie.plugins.nerdcommenter")
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('odie.plugins.nvim-tree')
    end
  }


  use 'tpope/vim-fugitive'
  use 'tpope/vim-git'
  use 'airblade/vim-gitgutter'

  --[[
  use {
  'ddense-analysis/ale',
  config = function()
  require('odie.plugins.ale')
  end

  BufWritePost,}
  use {
  'mfussenegger/nvim-lint',
  config = function()
  require('odie.plugins.lint')
  end

  }
  ]]--

  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('odie.plugins.null-ls')
    end,
    requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require("odie.plugins.nvim-lspconfig")
    end,
    after = 'null-ls.nvim'
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require("odie.plugins.nvim-cmp")
    end
  }


  use 'sukima/xmledit'
  use 'mattn/emmet-vim'

  --[[
  use {
  'vim-airline/vim-airline',
  config = function ()
  require('odie.plugins.airline')
  end,
  requires = 'vim-airline/vim-airline-themes'
  }
  ]]--

  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
      }
    end
  }

  use {
    'aserowy/tmux.nvim',
    config = function()
      require("odie.plugins.tmux")
    end
  }

  use 'Coacher/vim-virtualenv'

  use 'edkolev/tmuxline.vim'

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    config = function() require'odie.galaxyline.theme' end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

end
)
