local packer = require('packer')

packer.init {
    display = {
        open_fn = require('packer.util').float,
        prompt_border = 'double',
    }
}

local use = packer.use

packer.reset()
packer.startup(function()
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup {
                padding = false,
            }
        end
    }
    use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
    }
    use 'Yggdroot/indentLine'
    use 'tpope/vim-fugitive'
    use 'jiangmiao/auto-pairs'
    use 'airblade/vim-gitgutter'
    use 'maxboisvert/vim-simple-complete'
    use 'NLKNguyen/papercolor-theme'
    use 'glepnir/galaxyline.nvim'
    use 'Avimitin/nerd-galaxyline'

    use {
        'fatih/vim-go',
        run = ':GoInstallBinaries',
    }

  use {
      'ekickx/clipboard-image.nvim',
      config = function() require('clipboard-image').setup({
              default = {
                  img_dir = "img",
                  img_dir_txt = "img",
                  img_name = function()
                      vim.fn.inputsave()
                      local name = vim.fn.input('Image name: ')
                      vim.fn.inputrestore()

                      if name == nil or name == '' then
                          return os.date('%y-%m-%d-%H-%M-%S')
                      end
                      return name
                  end,
              }
          })
      end
  }

    use {
        'wbthomason/packer.nvim',
        opt = false,
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        config = function() require('nvim-tree').setup {
                open_on_setup = true,
                open_on_tab = false,
                view = {
                    width = 30,
                    relativenumber = true,
                },
                filters = {
                    dotfiles = true,
                },
                actions = {
                    open_file = {
                        resize_window = true,
                    }
                }
            }
        end
    }
    use {
        'folke/tokyonight.nvim',
        branch = 'main',
    }
  use 'ryanoasis/vim-devicons'
  use {
      "akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
      require("toggleterm").setup()
    end
  }
  use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
  }
  --use 'glepnir/dashboard-nvim'
  use 'hexdigest/gounit-vim'
  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter' 
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'williamboman/nvim-lsp-installer' -- auto install  :LspInstall
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
 	use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use 'brooth/far.vim'
end)
