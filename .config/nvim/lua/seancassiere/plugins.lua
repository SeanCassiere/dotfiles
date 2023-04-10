local status, packer = pcall(require, "packer")
if (not status) then
  print("You need to have Packer installed for the plugins to work!")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- use 'Tsuzat/NeoSolarized.nvim' -- NeoSolarized theme
  use 'navarasu/onedark.nvim'         -- OneDark theme

  use 'nvim-lualine/lualine.nvim'     -- Statusline
  use 'nvim-lua/plenary.nvim'         -- Common utilities
  use 'nvim-telescope/telescope.nvim' -- Search
  use 'nvim-telescope/telescope-file-browser.nvim'

  use 'nvim-tree/nvim-web-devicons' -- Web Dev Icons

  use 'norcalli/nvim-colorizer.lua'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }

  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim'

  use 'akinsho/nvim-bufferline.lua'
  use 'hrsh7th/cmp-buffer'              -- nvim-cmp source for buffer words
  use 'onsails/lspkind-nvim'            -- vscode-like pictograms
  use 'hrsh7th/cmp-nvim-lsp'            -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'                -- Completion
  use 'neovim/nvim-lspconfig'           -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'L3MON4D3/LuaSnip'
  use 'glepnir/lspsaga.nvim'            -- LSP UIs

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
end)
