local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Default plugins
  use "wbthomason/packer.nvim"  -- Have packer manage itself
  use "nvim-lua/popup.nvim"     -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"   -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs"   -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"   -- Easily comment stuff
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "ggandor/lightspeed.nvim"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "folke/which-key.nvim"
  use "folke/trouble.nvim"
  use "goolord/alpha-nvim"
  use "folke/todo-comments.nvim"
  use "ahmedkhalf/project.nvim"

  -- coloschemes
  use "sainnhe/gruvbox-material" -- Gruvbox material colorscheme

  -- cmp plugins
  use "hrsh7th/nvim-cmp"      -- Base autocomplete
  use 'hrsh7th/cmp-buffer'    -- for buffers
  use 'hrsh7th/cmp-path'      -- for paths
  use 'hrsh7th/cmp-cmdline'   -- for command line
  use 'quangnguyen30192/cmp-nvim-ultisnips'  -- for vim snippets in lua
  use 'hrsh7th/cmp-nvim-lsp'  -- lsp completion
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use 'L3MON4D3/LuaSnip'             -- snippet engine
  use 'rafamadriz/friendly-snippets' -- snippet repo

  -- LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use "neovim/nvim-lspconfig"             -- enable LSP
  use "jose-elias-alvarez/null-ls.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'
  use "nvim-telescope/telescope-project.nvim"

  -- Treesitter --
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Git signs --
  use "lewis6991/gitsigns.nvim"

  -- Fun things
  use "Eandrju/cellular-automaton.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
