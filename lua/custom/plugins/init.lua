-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'nvzone/showkeys',
    cmd = 'ShowkeysToggle',
    opts = {
      timeout = 1,
      position = 'top-right',
      -- more opts
    },
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    event = 'BufEnter',
    keys = {
      -- Move to previous/next
      { '<A-,>', '<Cmd>BufferPrevious<CR>', silent = true },
      { '<A-.>', '<Cmd>BufferNext<CR>', silent = true },

      -- Re-order to previous/next
      { '<A-<>', '<Cmd>BufferMovePrevious<CR>', silent = true },
      { '<A->>', '<Cmd>BufferMoveNext<CR>', silent = true },

      -- Close buffer
      { '<A-c>', '<Cmd>BufferClose<CR>', silent = true },
    },
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
  {
    'preservim/tagbar',
    keys = {
      { '<F3>', '<Cmd>TagbarToggle<CR>', desc = 'Tagbar' },
    },
    init = function()
      vim.cmd 'let g:tagbar_left = 1'
      vim.cmd 'let g:tagbar_width = 30'
      vim.cmd 'let g:tagbar_sort = 1'
      vim.cmd 'let g:tagbar_autofocus = 1'
      vim.cmd 'let g:tagbar_show_suffix = 0'
      vim.cmd 'let g:tagbar_silent = 1'
      vim.cmd 'let g:tagbar_scrolloff = 10'
    end,
  },
  'farmergreg/vim-lastplace',
  {
    'inkarkat/vim-mark',
    dependencies = { 'inkarkat/vim-ingo-library' },
    init = function()
      vim.cmd 'let g:mwDefaultHighlightingPalette = "maximum"'
    end,
  },
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
      'echasnovski/mini.icons',
      'saghen/blink.cmp',
    },
    opts = {
      preview = {
        icon_provider = 'internal',
        'mini',
        'devicons',
      },
    },
  },
  {
    'sindrets/diffview.nvim',
    keys = {
      { '<leader>do', '<Cmd>DiffviewOpen<CR>', desc = '[D]iffview [O]pen' },
      { '<leader>df', '<Cmd>DiffviewFileHistory %<CR>', desc = '[D]iffview [F]ile History' },
      { '<leader>dF', '<Cmd>DiffviewFileHistory<CR>', desc = '[D]iffview [F]iles History' },
      { '<leader>dc', '<Cmd>DiffviewClose<CR>', desc = '[D]iffview [C]lose' },
    },
    opts = {
      view = {
        merge_tool = {
          -- Config for conflicted files in diff views during a merge or rebase.
          layout = 'diff4_mixed',
        },
      },
    },
  },
  {
    'brenoprata10/nvim-highlight-colors',
    opts = {},
  },
  {
    'guru245/lualine.nvim',
    dependencies = {
      'arkav/lualine-lsp-progress',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local colors = require('catppuccin.palettes').get_palette 'macchiato'
      require('lualine').setup {
        sections = {
          lualine_c = {
            'filename',
            {
              'lsp_progress',
              display_components = { 'lsp_client_name', { 'title', 'percentage', 'message' } },
              colors = {
                percentage = colors.yellow,
                title = colors.yellow,
                message = colors.yellow,
                spinner = colors.yellow,
                lsp_client_name = colors.yellow,
                use = true,
              },
            },
          },
        },
        extensions = {
          'nvim-tree',
          'man',
          'mason',
          'tagbar',
        },
      }
    end,
  },
  {
    'karb94/neoscroll.nvim',
    opts = {},
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      messages = {
        enabled = false,
      },
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
  },
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
      'echasnovski/mini.icons',
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      picker = {
        layout = {
          cycle = false,
          preset = 'vertical',
          layout = {
            backdrop = false,
            width = 0.85,
            min_width = 80,
            height = 0.85,
            min_height = 30,
            box = 'vertical',
            border = 'rounded',
            title = '{title} {live} {flags}',
            title_pos = 'center',
            { win = 'input', height = 1, border = 'bottom' },
            { win = 'list', border = 'none' },
            { win = 'preview', title = '{preview}', height = 0.6, border = 'top' },
          },
        },
      },
    },
    keys = {
      -- stylua: ignore start
      { '<leader>sh', function() Snacks.picker.help() end, desc = '[S]earch [H]elp' },
      { '<leader>sm', function() Snacks.picker.man() end, desc = '[S]earch [M]an pages' },
      { '<leader>sk', function() Snacks.picker.keymaps() end, desc = '[S]earch [K]eymaps' },
      { '<leader>sf', function() Snacks.picker.files() end, desc = '[S]earch [F]iles' },
      { '<leader>ss', function() Snacks.picker.pick() end, desc = '[S]earch [S]elect Picker', },
      { '<leader>sw', function() Snacks.picker.grep_word() end, desc = '[S]earch current [W]ord', mode = { 'n', 'x' } },
      { '<leader>sg', function() Snacks.picker.grep() end, desc = '[S]earch by [G]rep' },
      { '<leader>sd', function() Snacks.picker.diagnostics() end, desc = '[S]earch [D]iagnostics' },
      { '<leader>sr', function() Snacks.picker.resume() end, desc = '[S]earch [R]esume' },
      { '<leader>s.', function() Snacks.picker.recent() end, desc = '[S]earch Recent Files ("." for repeat)' },
      { '<leader><leader>', function() Snacks.picker.buffers() end, desc = '[ ] Find existing buffers' },
      { '<leader>s/', function() Snacks.picker.grep_buffers() end, desc = '[/] Fuzzily search in current buffer' },
      { '<leader>st', function() Snacks.picker.todo_comments() end, desc = '[S]earch [T]odo' },
      { '<leader>sT', function () Snacks.picker.todo_comments({ keywords = { 'TODO', 'FIX', 'FIXME' } }) end, desc = '[S]earch [T]odo/Fix/Fixme' },
      -- stylua: ignore end
    },
  },
  {
    'olimorris/persisted.nvim',
    event = 'BufReadPre', -- Ensure the plugin loads only when a buffer has been loaded
    keys = {
      { '<leader>sp', '<Cmd>Telescope persisted<CR>', desc = '[S]earch [P]roject' },
    },
    config = function()
      local utils = require 'persisted.utils'
      local allowed_dirs = {
        '~/.local/src',
      }
      require('persisted').setup {
        should_save = function()
          return utils.dirs_match(vim.fn.getcwd(), allowed_dirs)
        end,
        use_git_branch = true,
      }
      require('telescope').setup {
        extensions = {
          persisted = {
            initial_mode = 'normal',
          },
        },
      }
      pcall(require('telescope').load_extension 'persisted')

      vim.opt.sessionoptions:append 'globals'
      vim.api.nvim_create_autocmd({ 'User' }, {
        pattern = 'PersistedSavePre',
        group = vim.api.nvim_create_augroup('PersistedHooks', {}),
        callback = function()
          vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })
        end,
      })

      vim.api.nvim_create_autocmd('User', {
        pattern = 'PersistedTelescopeLoadPre',
        callback = function(session)
          -- Save the currently loaded session passing in the path to the current session
          require('persisted').save { session = vim.g.persisted_loaded_session }

          -- Delete all of the open buffers
          vim.api.nvim_input '<ESC>:%bd!<CR>'
        end,
      })
    end,
  },
}
