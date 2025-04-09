return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        transparent = true,
        styles = {
          comments = { italic = false }, -- Disable italics in comments
          floats = 'transparent',
        },
        on_colors = function(colors)
          colors.bg_sidebar = '#0a0f16'
          colors.bg_highlight = '#1a1b26'
          colors.git = {
            add = '#67814c',
            change = '#bb6f43',
            delete = '#d14d5d',
          }
        end,

        on_highlights = function(highlights, colors)
          highlights.BufferLineIndicatorSelected = {
            fg = colors.blue,
            bg = colors.bg_sidebar,
          }
        end,
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
