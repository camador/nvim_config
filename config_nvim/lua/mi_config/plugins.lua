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

require('lazy').setup({
  --
  -- My plugins here
  --

  -- https://github.com/vhyrro/luarocks.nvim
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
    -- Hacer :Lazy build luarocks.nvim para forzar la configuración
  },
  {
    -- Hacer :Lazy build neorg para forzar la configuración
    "nvim-neorg/neorg",
    opts = {},
    dependencies = { "luarocks.nvim" },
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
    -- config = function()
    --         require("neorg").setup({
    --           -- put any of your previous config here
    --         })
    --     end,
  },

  -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/popup.nvim",

  -- Useful lua functions used by lots of plugins
  "nvim-lua/plenary.nvim",

  -- Colorschemes
  "lunarvim/colorschemes",
  -- "folke/tokyonight.nvim",
  -- "sainnhe/edge",
  "catppuccin/nvim",

  -- Autocompletado
  -- Tras añadir un plugin a esta lista (cmp plugins) hay que incluirlo
  -- en la configuración de sources en ~/desarrollo/nvim_config/config_nvim/lua/mi_config/cmp.lua
  --
  -- cmp plugins
  "hrsh7th/nvim-cmp",         -- The completion plugin
  "hrsh7th/cmp-buffer",       -- buffer completions
  "hrsh7th/cmp-path",         -- path completions
  "hrsh7th/cmp-cmdline",      -- cmdline completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",     -- LSP completions

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    -- :checkhelp luasnip, si dice que no está instalado ir
    -- a ~/.local/share/nvim/lazy/LuaSnip y ejecutar make install_jsregexp
  }, --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  --
  -- LSP
  --

  -- Java - https://github.com/nvim-java/nvim-java
  {
    'nvim-java/nvim-java',
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-refactor',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      {
        'williamboman/mason.nvim',
        opts = {
          registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
          },
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        },
      }
    },
  },

  -- Ya incluido con nvim-java. Descomentar si se elimina ese plugin
  -- {
  --   "williamboman/mason.nvim",    -- simple to use language server installer
  --   build = ":MasonUpdate",       -- :MasonUpdate updates registry contents
  -- },
  "williamboman/mason-lspconfig.nvim", -- bridge between lspconfig and mason

  -- Ya incluido con nvim-java. Descomentar si se elimina ese plugin
  --"neovim/nvim-lspconfig",             -- enable LSP

  --"jose-elias-alvarez/null-ls.nvim",  -- Formatting, linting, diagnostics, code actions (ARCHIVADO)
  "nvimtools/none-ls.nvim",  -- Formatting, linting, diagnostics, code actions

  --- Copilot
  --- Because the copilot server takes some time to start up, it is recommend that you lazy load copilot:
  {
    "zbirenbaum/copilot.lua",
    --cmd = "Copilot",
    --event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function ()
          require("copilot_cmp").setup()
        end
      },
    },
  },

  -- Telescope - Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    --tag = "0.1.1",
    -- or                            , branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  }, -- Native sorter to increase performance
  "nvim-tree/nvim-web-devicons",                                -- File icons

  -- Ayudas para el código
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate" -- Actualiza parsers cada vez que se inicia NVim
  }, -- Parser, syntax highlinthing
  "HiPhish/rainbow-delimiters.nvim",              -- Rainbow parentheses
  "windwp/nvim-autopairs",                        -- Autopairs, integrates with both cmp and treesitter
  "numToStr/Comment.nvim",                        -- Comentarios
  "JoosepAlviste/nvim-ts-context-commentstring",  -- Comentarios según el contexto
  "tpope/vim-surround",                           -- Inserta y edita pares de tags, paréntesis, comillas, etc.
  "tpope/vim-rails",                              -- Desarrollo de aplicaciones Rails.
  "rstacruz/sparkup",                             -- Permite escribir HTML muy rápido

  -- Git
  "lewis6991/gitsigns.nvim", -- Indicadores visuales para los cambios de Git

  -- Interfaz y navegación
  "nvim-tree/nvim-tree.lua",   -- A File Explorer For Neovim Written In Lua
  "nvim-lualine/lualine.nvim", -- Statusline
  "easymotion/vim-easymotion", -- Facilita y acelera los movimientos en el texto visualizado.

  --
  -- End of my plugins
  --
})
