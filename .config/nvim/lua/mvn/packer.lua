return require("packer").startup(function(use)
  -- local
  use {
    "/home/mvn/projects/gotools-nvim",
    config = function()
      require("gotools-nvim").setup()
    end
  }

  use "wbthomason/packer.nvim"

  use "nvim-lualine/lualine.nvim"

  use "folke/tokyonight.nvim"
  use {
    "folke/trouble.nvim",
    requires = { "nvim-tree/nvim-web-devicons" }
  }

  -- file navigation
  use "theprimeagen/harpoon"
  use "nvim-tree/nvim-tree.lua"

  use "tpope/vim-fugitive"

  -- formatting
  use "tpope/vim-endwise"
  use "rstacruz/vim-closer"
  use { "windwp/nvim-ts-autotag", config = { function()
    require("nvim-ts-autotag").setup {}
  end } }

  use {
    "norcalli/nvim-colorizer.lua",
    config = function() require "colorizer".setup() end
  }

  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    requires = { { "nvim-lua/plenary.nvim" } }
  }

  use {
    "nvim-treesitter/nvim-treesitter", run = ":TSUpdate"
  }
  use "nvim-treesitter/playground"

  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "vrischmann/tree-sitter-templ" },
      -- Autocompletion
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/nvim-cmp" },
      { "saadparwaiz1/cmp_luasnip" },
      { "L3MON4D3/LuaSnip" },
    }
  }
end)
