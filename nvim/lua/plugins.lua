return {
  -- core
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- lsp + cmp
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "L3MON4D3/LuaSnip",

  -- theme
  "folke/tokyonight.nvim",

  -- statusline
  "nvim-lualine/lualine.nvim",

  -- git signs
  "lewis6991/gitsigns.nvim",

  -- fzf
  "junegunn/fzf",
  "junegunn/fzf.vim",
}

