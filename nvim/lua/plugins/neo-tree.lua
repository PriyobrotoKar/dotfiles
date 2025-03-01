-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behaviour = 'open_current',
      window = {
        width = 35,
        mappings = {
          ['e'] = 'close_window',
          ['l'] = 'open',
          ['h'] = 'close_node',
        },
      },
    },

    default_component_configs = {
      git_status = {
        symbols = {
          -- Change type
          added = '✚', -- NOTE: you can set any of these to an empty string to not show them
          deleted = '✖',
          modified = '',
          renamed = '',
          -- Status type
          untracked = 'U',
          ignored = '',
          unstaged = 'M',
          staged = 'A',
          conflict = '',
        },
        align = 'right',
      },
    },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)
    vim.api.nvim_create_autocmd('TermClose', {
      pattern = '*lazygit',
      callback = function()
        if package.loaded['neo-tree.sources.git_status'] then
          require('neo-tree.sources.git_status').refresh()
        end
      end,
    })
  end,
}
