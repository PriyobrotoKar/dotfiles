return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        component_separators = "",
        section_separators = "",
        theme = "iceberg_dark",
        globalstatus = true,
      },
    })
  end,
}
