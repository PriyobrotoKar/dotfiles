return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    local transparent = true -- set to true if you would like to enable transparency

    require("tokyonight").setup({
      on_highlights = function(highlights)
        highlights = highlights
      end,
      style = "moon",
      transparent = transparent,
      styles = {
        floats = transparent and "transparent" or "dark",
      },
      on_colors = function(colors)
        colors.bg_sidebar = "#14161b"
      end,
    })

    vim.cmd("colorscheme tokyonight")
  end,
}
