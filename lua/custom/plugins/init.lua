-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Turn on plugin and indent, depending on file type
vim.cmd 'filetype plugin indent on'

vim.o.wrap = false
vim.o.guicursor = ''

-- Set tab size
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- Tell Vim to delete the white space at the start of the line, a line break
-- and the character before where Insert mode started.
vim.o.backspace = 'indent,eol,start'

-- Work for C-like programs, but can also be used for other languages
vim.o.smartindent = true

-- Copy indent from current line when starting a new line. This should be
-- on when smartindent is used.
vim.o.autoindent = true

-- Set indent for switch statement in C. Just my cup of tea.
vim.o.cinoptions = ':0'

-- Determine the 'fileencoding' of a file being opened.
vim.o.fileencodings = 'utf-8,cp949,cp932,euc-kr,shift-jis,big5,ucs-2le,latin'

-- Represent data in memory
vim.o.encoding = 'utf-8'

-- Use only unix fileformat. "dos" can be added like "unix, dos"
vim.o.fileformats = 'unix'

-- Set 80, 100 column guideline
vim.cmd 'set colorcolumn=100'
vim.cmd 'let &colorcolumn="80,".join(range(100,100),",")'

-- Not search wrap around the end of a file
vim.o.wrapscan = false

-- Jump to one to the other using %. Various character can be added.
vim.opt.matchpairs:append '<:>'

-----------------------
-- Mappings
-----------------------
-- Move source code by tab size. Tab is right move and Shift+tab is left.
vim.keymap.set('v', '<Tab>', '>gv')
vim.keymap.set('v', '<S-Tab>', '<gv')
vim.keymap.set('n', '<F2>', '<Cmd>w!<CR>')

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
    config = function()
      require('barbar').setup {}
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<C-h>', '<Cmd>BufferPrevious<CR>', opts)
      vim.keymap.set('n', '<C-l>', '<Cmd>BufferNext<CR>', opts)

      -- Save and close the buffer
      vim.keymap.set('n', ',w', '<Cmd>BufferClose<CR>', { desc = 'Close the buffer' })
    end,
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
