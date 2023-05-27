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
  --
  -- My plugins here
  --

  -- Have packer manage itself
  use("wbthomason/packer.nvim")

  -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/popup.nvim")

  -- Useful lua functions used by lots of plugins
  use("nvim-lua/plenary.nvim")

  -- Colorschemes
  use("lunarvim/colorschemes")
  use("folke/tokyonight.nvim")
  use("sainnhe/edge")
  use("catppuccin/nvim")

  -- Autocompletado
  -- Tras añadir un plugin a esta lista (cmp plugins) hay que incluirlo
  -- en la configuración de sources en ~/desarrollo/nvim_config/config_nvim/lua/mi_config/cmp.lua
  --
  -- cmp plugins
  use("hrsh7th/nvim-cmp")        -- The completion plugin
  use("hrsh7th/cmp-buffer")      -- buffer completions
  use("hrsh7th/cmp-path")        -- path completions
  use("hrsh7th/cmp-cmdline")     -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")    -- LSP completions

  -- snippets
  use("L3MON4D3/LuaSnip")            --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  use({
    "williamboman/mason.nvim",            -- simple to use language server installer
    run = ":MasonUpdate",                 -- :MasonUpdate updates registry contents
  })
  use("williamboman/mason-lspconfig.nvim") -- bridge between lspconfig and mason
  use("neovim/nvim-lspconfig")            -- enable LSP
  use("jose-elias-alvarez/null-ls.nvim")  -- Formatting, linting, diagnostics, code actions

  --- Copilot
  --- Because the copilot server takes some time to start up, it is recommend that you lazy load copilot:
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  }
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup()
    end
  }

  -- Telescope - Fuzzy finder
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    -- or                            , branch = '0.1.x',
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- Native sorter to increase performance
  use("nvim-tree/nvim-web-devicons")                               -- File icons

  -- Ayudas para el código
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" }) -- Parser, syntax highlinthing
  use("p00f/nvim-ts-rainbow")                                  -- Rainbow parentheses. NO LONGER MAINTENED
  use("windwp/nvim-autopairs")                                 -- Autopairs, integrates with both cmp and treesitter
  use("numToStr/Comment.nvim")                                 -- Comentarios
  use("JoosepAlviste/nvim-ts-context-commentstring")           -- Comentarios según el contexto
  use("tpope/vim-surround")                                    -- Inserta y edita pares de tags, paréntesis, comillas, etc.
  use("tpope/vim-rails")                                       -- Desarrollo de aplicaciones Rails.

  -- Git
  use("lewis6991/gitsigns.nvim") -- Indicadores visuales para los cambios de Git

  -- Interfaz y navegación
  use("nvim-tree/nvim-tree.lua")  -- A File Explorer For Neovim Written In Lua
  use("nvim-lualine/lualine.nvim") -- Statusline
  use("easymotion/vim-easymotion") -- Facilita y acelera los movimientos en el texto visualizado.
  --
  -- End of my plugins
  --

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
