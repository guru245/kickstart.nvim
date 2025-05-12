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
    init = function()
      local opts = { noremap = true, silent = true }

      vim.g.barbar_auto_setup = false
      vim.keymap.set('n', '<C-h>', '<Cmd>BufferPrevious<CR>', opts)
      vim.keymap.set('n', '<C-l>', '<Cmd>BufferNext<CR>', opts)

      -- Save and close the buffer
      vim.keymap.set('n', ',w', '<Cmd>BufferClose<CR>', { desc = 'Close the buffer' })
    end,
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
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
    end,
  },
  {
    'farmergreg/vim-lastplace',
    event = { 'BufReadPost' },
  },
  {
    'ayuanx/vim-mark-standalone',
    event = { 'BufReadPost' },
  },
  {
    'OXY2DEV/markview.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
      'echasnovski/mini.icons',
      'saghen/blink.cmp',
    },
    ft = { 'markdown' },
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
      { '<leader>df', '<Cmd>DiffviewFileHistory %<CR>', desc = '[D]iffview' },
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
    event = { 'BufReadPost' },
    opts = {
      -- add any options here
    },
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
    event = { 'BufReadPost' },
    opts = {},
  },
}
