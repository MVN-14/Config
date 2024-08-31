-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    "folke/tokyonight.nvim",
    "nvim-lualine/lualine.nvim",
    --   "nvim-treesitter/playground",
    "tpope/vim-fugitive",

    -- formatting
    "tpope/vim-endwise",
    "rstacruz/vim-closer",

    -- file navigation
    "theprimeagen/harpoon",
    "nvim-tree/nvim-tree.lua",

    { dir = "/home/mvn/projects/gotools-nvim" },
    {
      "folke/trouble.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {},
      cmd = "Trouble",
      keys = {
        {
          "<leader>tt",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "[T]rouble [T]oggle"
        }
      }
    },
    {
      "windwp/nvim-ts-autotag",
      config = function()
        require("nvim-ts-autotag").setup {}
      end
    },
    {
      "norcalli/nvim-colorizer.lua",
      config = function() require "colorizer".setup() end
    },
    {
      "nvim-telescope/telescope.nvim",
      version = "0.1.5",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate"
    },
    {
      "VonHeikemen/lsp-zero.nvim",
      branch = "v3.x",
      dependencies = {
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
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
