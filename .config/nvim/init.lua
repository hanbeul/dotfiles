vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {})
vim.api.nvim_set_keymap('n', '<c-k>', '<c-y>', {})
vim.api.nvim_set_keymap('n', '<c-j>', '<c-e>', {})
vim.api.nvim_set_keymap('n', 'ScrollWheelUp', '<c-y>', {})
vim.api.nvim_set_keymap('n', 'ScroolWheelDown', '<c-e>', {})
vim.api.nvim_set_keymap('n', 'gh', '<Cmd>BufferPrevious<CR>', {})
vim.api.nvim_set_keymap('n', 'gl', '<Cmd>BufferNext<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>wv', '<Cmd>vsplit<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>w=', '<Cmd>wincmd =<CR>', {})
vim.api.nvim_set_keymap('n', '<c-w>', '<Cmd>BufferClose<CR>', {})
vim.api.nvim_set_keymap('n', 'U', '<Cmd>redo<CR>', {})

vim.opt.number = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop

-- Autoinstall lazy nvim if not present
if not uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release,
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
    {'dracula/vim',
      config = function()
        -- Set colorscheme
        vim.opt.termguicolors = true
        vim.cmd.colorscheme('dracula')
      end
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
          highlight = {
            enable = true,
          },
          indent = {
            enable = true,
          }
        })
      end
    },
    { "lukas-reineke/indent-blankline.nvim",main = "ibl", opts = {}},
    { "alexghergh/nvim-tmux-navigation", config = function()
      local nvim_tmux_nav = require('nvim-tmux-navigation')
      nvim_tmux_nav.setup {
        disable_when_zoomed = false -- defaults to false
      }

      vim.keymap.set('n', '<A-h>', nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', '<A-j>', nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', '<A-k>', nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', '<A-l>', nvim_tmux_nav.NvimTmuxNavigateRight)

      vim.keymap.set('n', '˙', nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', '∆', nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', '˚', nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', '¬', nvim_tmux_nav.NvimTmuxNavigateRight)
    end
  },
  {
    "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup{
        defaults = {
          -- Default configuration for telescope goes here:
          -- config_key = value,
          mappings = {
            i = {
              -- map actions.which_key to <C-h> (default: <C-/>)
              -- actions.which_key shows the mappings for your picker,
              -- e.g. git_{create, delete, ...}_branch for the git_branches picker
              ["<C-j>"] = require('telescope.actions').move_selection_next,
              ["<C-k>"] = require('telescope.actions').move_selection_previous
            }
          }
        },
        pickers = {
          -- Default configuration for builtin pickers goes here:
          -- picker_name = {
              --   picker_config_key = value,
              --   ...
              -- }
          -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
        },
        extensions = {
          -- Your extension configuration goes here:
          -- extension_name = {
              --   extension_config_key = value,
              -- }
          -- please take a look at the readme of the extension you want to configure
        }
      }
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      animation = true,
    }
  },
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      on_attach = on_attach_change
    }
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = function()
      require('mason').setup()
    end,
  },
})
