local overrides = require "custom.configs.overrides"

local plugins = {

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "folke/neodev.nvim",
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lsp.servers"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    init = function()
      require("core.utils").load_mappings "harpoon"
    end,
    config = function()
      local harpoon = require "harpoon"
      harpoon:setup {}
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = overrides.nvimtree,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require "custom.configs.lsp.lspsaga"
    end,
  },

  {
    "pmizio/typescript-tools.nvim",
    ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^3",
    ft = { "rust" },
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "folke/which-key.nvim",
    config = function()
      require "custom.configs.whichkey"
    end,
  },
}

return plugins
