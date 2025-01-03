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
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- nvim plugins
  use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "50012918b2fc8357b87cff2a7f7f0446e47da174" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "32d9627123321db65a4f158b72b757bcaef1a3f4" }
  -- use { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }
  -- use { "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" }
  use { "akinsho/bufferline.nvim" }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "nvim-lualine/lualine.nvim" }
  use { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" }
  use { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" }
  use { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }
  use {
    'phaazon/hop.nvim',
    commit = "1a1eceafe54b5081eae4cb91c723abd1d450f34b",
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  -- Colorschemes / themes
  use {
    "maxmx03/solarized.nvim",
    config = function()
      vim.o.background = 'dark'
      ---@type solarized
      local solarized = require('solarized')
      vim.o.termguicolors = true
      vim.o.background = 'dark'
      solarized.setup({})
      vim.cmd.colorscheme 'solarized'
    end
  }

  -- Tree
  use { "ryanoasis/vim-devicons", commit = "71f239af28b7214eebb60d4ea5bd040291fb7e33" }
  use { "preservim/nerdtree", commit = "3a66272486083bbafb1b764009a1ba5e4ee684da" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
  use { "hrsh7th/cmp-nvim-lua", commit = "f12408bdb54c39c23e67cab726264c10db33ada8" }

  -- snippets
  use { "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use

  -- LSP
  -- use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
  use { 'seblj/nvim-echo-diagnostics' }
  use { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "bfc5997e52fe9e20642704da050c415ea1d4775f" }
  use { "williamboman/mason-lspconfig.nvim", commit = "0eb7cfefbd3a87308c1875c05c3f3abac22d367c" }
  use { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" }
  use { "MunifTanjim/eslint.nvim", commit = "158f2289907d377018752fcfe0d61b746dc11767" }
  use { "sbdchd/neoformat", commit = "aedb6f9d3f53d5da229095f7d761d749f8c5c7e0" }
  use { "styled-components/vim-styled-components", commit = "75e178916fc3e61385350933a23055927f5f60b7" }
  use { "simrat39/rust-tools.nvim", commit = "0cc8adab23117783a0292a0c8a2fbed1005dc645" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim", tag = '0.1.4' }
  use { "nvim-telescope/telescope-fzf-native.nvim", commit = "6c921ca12321edaa773e324ef64ea301a1d0da62", run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" }
  use ({ "kelly-lin/telescope-ag", commit = "7d25064da3c7689461bcfa89ad1f08548415193d", requires = { { "nvim-telescope/telescope.nvim" } } })
  use { "smartpde/telescope-recent-files", commit = "6893cda11625254cc7dc2ea76e0a100c7deeb028" }


  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    commit = "afa103385a2b5ef060596ed822ef63276ae88016",
    -- 'manually run :TSUpdate if it causes problems'
  }
  use { "tree-sitter/tree-sitter-javascript", commit = "f1e5a09b8d02f8209a68249c93f0ad647b228e6e" }
  use { "tree-sitter/tree-sitter-typescript" }
  use { "tree-sitter/tree-sitter-rust", commit = "48e053397b587de97790b055a1097b7c8a4ef846" }
  use { "ikatyang/tree-sitter-toml", commit = "8bd2056818b21860e3d756b5a58c4f6e05fb744e" }

  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" }
  use { "tpope/vim-fugitive", commit = "cbe9dfa162c178946afa689dd3f42d4ea8bf89c1" }

  -- DAP
  use { "mfussenegger/nvim-dap", commit = "6b12294a57001d994022df8acbe2ef7327d30587" }
  use { "rcarriga/nvim-dap-ui", commit = "1cd4764221c91686dcf4d6b62d7a7b2d112e0b13" }
  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

  -- ai fuck shit
  use({
    "jackMort/ChatGPT.nvim",
    commit = "aadb607038d53d97be4da368b07355f65ad3f047",
    config = function()
      require("chatgpt").setup()
    end,
    requires = {
      { "MunifTanjim/nui.nvim", commit = "1d044af" },
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })

  -- oldschool vim / general utilities
  use { "realestninja/nerdcommenter" }
  use { "realestninja/vim-printer" }
  use { "simeji/winresizer", commit = "9bd559a03ccec98a458e60c705547119eb5350f3" }
  use { "wesQ3/vim-windowswap", commit = "15db3f697aa1fa696d99fcdc920c90cd2cec855e" }
  use { "terryma/vim-expand-region", commit = "966513543de0ddc2d673b5528a056269e7917276" }
  use { "tpope/vim-surround", commit = "3d188ed2113431cf8dac77be61b842acb64433d9" }
  use { "editorconfig/editorconfig-vim", commit = "0d54ea863089fb13be423b4aed6cca35f3a5d778" }
  -- use {
      -- 'junegunn/fzf.vim',
      -- commit = "70c461c60bb1e2165a378e8ba0451b511c29b5cb",
      -- requires = { 'junegunn/fzf', run = ':call fzf#install()' }
  -- }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
