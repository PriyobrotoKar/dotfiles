return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  opts = function()
    -- Original options
    local opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = false, -- handled by nvim-cmp / blink.cmp
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    }

    vim.keymap.set("i", "<Tab>", function()
      local copilot = require("copilot.suggestion")
      if copilot.is_visible() then
        copilot.accept()
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
      end
    end, { silent = true, noremap = true, expr = false })

    -- Adding the new functionality
    LazyVim.cmp.actions.ai_accept = function()
      local copilot = require("copilot.suggestion")
      if copilot.is_visible() then
        LazyVim.create_undo()
        copilot.accept()
        return true
      end
    end
    return opts
  end,
}
